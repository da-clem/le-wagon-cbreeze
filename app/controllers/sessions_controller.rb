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
      make_google_calendar_reservations
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

  private

  def make_google_calendar_reservations
    @calendar = GoogleCalendarWrapper.new(current_user)
    @calendar.insert_in_calendar(@session)
  end

end
