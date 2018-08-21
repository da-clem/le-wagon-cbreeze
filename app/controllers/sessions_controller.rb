class SessionsController < ApplicationController


  def index
    policy_scope(Session)
    @sessions = Session.where(user: current_user).joins(:forecast).where('forecasts.date >= ?', Date.today.to_s)
  end

  def create
    @session = Session.new
    @session.forecast = Forecast.find(params[:id])
    @session.user = current_user
    authorize @session

    if @session.save
      redirect
    else
      #render :new
    end
  end

  def destroy
    @session = Session.where(forecast_id: params[:id], user_id: current_user)
    authorize @session

    # TODO - must replace the destroy_all method with destoy once validation is ready.
    @session.destroy_all
  end

  def redirect
    client = Signet::OAuth2::Client.new(client_options)

    redirect_to client.authorization_uri.to_s
  end

  def callback
    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]

    response = client.fetch_access_token!
    authorize Session.last
    session[:authorization] = response
    redirect_to calendars_path
  end

  def calendars
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    authorize Session.last
    @calendar_list = service.list_calendar_lists
  end

  private

  def client_options
    {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: "http://localhost:3000/mysessions/callback"
    }
  end

end
