class OpenweathermapJob < ApplicationJob
  queue_as :default

  TRANSL = {
    9..11 => "11",
    12..14 => "15",
    16..18 => "19",
  }

  def perform(*args)
    # Do something later
    require 'json'
    require 'open-uri'

    Spot.all.each do |spot|
      current_spot = spot
      lat = current_spot.latitude
      long = current_spot.longitude
      Time.zone = current_spot.timezone


      url = "https://api.openweathermap.org/data/2.5/forecast?lat=#{lat}&lon=#{long}&APPID=cc4abf8eb2c6cbf74e3cd9c323997b24"
      weather_serialized = open(url).read
      weather = JSON.parse(weather_serialized)

      weather["list"].each do |forecast|
        timestamp = Time.parse(forecast["dt_txt"])
        timestamp = timestamp.in_time_zone

        if (9..11).include? timestamp.hour or (12..14).include? timestamp.hour or (16..18).include? timestamp.hour
          existing_forecast = Forecast.where("spot_id = ? AND date = ? AND time_slot = ?", current_spot.id, timestamp.strftime("%Y-%m-%d"), find_timeslot(timestamp.hour) )[0]
          if existing_forecast
            existing_forecast.weather_code = forecast["weather"][0]["icon"]
            existing_forecast.save!
          end
        end
      end
    end
  end

  def find_timeslot(hour)
    TRANSL.each do |num, timeslot|
      if num === hour
        return timeslot
      end
    end
  end

end



