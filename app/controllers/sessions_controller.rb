class SessionsController < ApplicationController


  def index
    policy_scope(Session)
    @sessions = Session.all
  end

  def create
    @session = Session.new
    @session.forecast = Forecast.find(params[:id])
    @session.user = current_user
    authorize @session

     if @session.save
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

end
