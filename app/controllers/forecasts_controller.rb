class ForecastsController < ApplicationController
  def index
    @forecasts = policy_scope(Forecast)
    @sessions = Session.where(user: current_user).pluck(:forecast_id).uniq
    @forecasts.each do |forecast|
      puts forecast.spot.name
    end
  end
end
