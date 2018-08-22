class ForecastsController < ApplicationController
  def index
    @forecasts = policy_scope(Forecast).includes(:spot).order('spots.name asc')
    @sessions = Session.where(user: current_user).pluck(:forecast_id).uniq
    @forecasts.each do |forecast|
      puts forecast.spot.name
    end
  end
end
