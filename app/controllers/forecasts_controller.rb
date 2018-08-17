class ForecastsController < ApplicationController
  def index
    @forecasts = policy_scope(Forecast)
    @sessions = Session.where(user: current_user).pluck(:forecast_id).uniq
  end
end
