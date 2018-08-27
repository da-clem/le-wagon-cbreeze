class ForecastsController < ApplicationController
  def index
    @forecasts = policy_scope(Forecast).includes(:spot).order('spots.name asc')
    @forecasts11 = policy_scope(Forecast).where(time_slot: "11").includes(:spot).order('spots.name asc')
    @forecasts15 = policy_scope(Forecast).where(time_slot: "15").includes(:spot).order('spots.name asc')
    @forecasts19 = policy_scope(Forecast).where(time_slot: "19").includes(:spot).order('spots.name asc')
    @sessions = Session.where(user: current_user).pluck(:forecast_id).uniq
  end
end
