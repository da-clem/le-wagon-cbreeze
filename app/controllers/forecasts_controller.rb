class ForecastsController < ApplicationController
  def index
    @forecasts = policy_scope(Forecast)
  end
end
