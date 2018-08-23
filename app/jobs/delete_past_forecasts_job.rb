class DeletePastForecastsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Deleting past forecasts..."
    Forecast.where("date <= ?", Date.yesterday.prev_day.to_s).delete_all
    puts "Finished deleting past forecasts"
  end
end
