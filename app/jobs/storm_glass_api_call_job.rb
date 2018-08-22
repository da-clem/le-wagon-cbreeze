class StormGlassApiCallJob < ApplicationJob
  queue_as :default



  API_TRANSLATIONS = {
    "airTemperature" => :temperature,
    "gust" => :wind_gust,
    "waveDirection" => :wave_direction,
    "waveHeight" => :wave_heigth,
    "wavePeriod" => :wave_period,
    "windDirection" => :wind_direction,
    "windSpeed" => :wind_speed
  }

  DIRECTION_TRANSLATIONS = {
    0...22.5 => "NN",
    337.5..360 => "NN",
    22.5...67.5 => "NE",
    67.5...112.5 => "EE",
    112.5...157.5 => "SE",
    157.5...202.5 => "SS",
    202.5...247.5 => "SW",
    247.5...292.5 => "WW",
    292.5...337.5 => "NW",
  }


  def perform(*args)
    require 'json'
    require 'open-uri'

    Spot.all.each do |spot|
      puts spot.name
      current_spot = spot
      lat = current_spot.latitude
      long = current_spot.longitude
      Time.zone = current_spot.timezone
      startTS = Time.zone.yesterday.beginning_of_day.utc.to_i
      endTS = (Time.zone.yesterday.beginning_of_day.utc + 6.days).to_i

      url = "https://api.stormglass.io/point?lat=#{lat}&lng=#{long}&params=airTemperature,waveHeight,gust,waveDirection,wavePeriod,windDirection,windSpeed&end=#{endTS}&start=#{startTS}"
      data_serialized = open(url, "Authorization" => "e2b60dd4-8f9c-11e8-83ef-0242ac130004-e2b60fdc-8f9c-11e8-83ef-0242ac130004").read
      data = JSON.parse(data_serialized)

      #File.open("public/baba_#{beach_name}.json","w") do |f|
      #  f.write(data)
      #end

      #file = File.read('app/jobs/baba.json')
      #data = JSON.parse(file)

      hash_forecast = Hash.new(0)

      data["hours"].each do |forcast|
        timestamp = Time.parse(forcast["time"])
        timestamp = timestamp.in_time_zone
        puts timestamp
        if (8..19).include?(timestamp.hour)
          forcast.each do |key, value|
            hash_forecast[key] += value.detect{|h| h["source"]=="sg"}["value"] if value.kind_of?(Array) && !value.empty?
          end
        end
        if [11, 15, 19].include? timestamp.hour
          hash_forecast = Hash[hash_forecast.map { |key, value| [API_TRANSLATIONS[key], value/4] }]

          begin
            hash_forecast[:wind_direction] = find_direction(hash_forecast[:wind_direction])
            hash_forecast[:wave_direction] = find_direction(hash_forecast[:wave_direction])
            hash_forecast[:temperature] = round_to_integer(hash_forecast[:temperature])
            hash_forecast[:wind_speed] = round_to_integer(hash_forecast[:wind_speed]*1.943844)
            hash_forecast[:wind_gust] = round_to_integer(hash_forecast[:wind_gust]*1.943844)
            hash_forecast[:wave_heigth] = round_to_one_decimal(hash_forecast[:wave_heigth])
            hash_forecast[:wave_period] = round_to_integer(hash_forecast[:wave_period])
            hash_forecast[:spot_id] = current_spot.id
            hash_forecast[:time_slot] = timestamp.hour
            hash_forecast[:date] = timestamp.strftime("%Y-%m-%d")
            hash_forecast[:weather_code] = "02d"
          rescue NoMethodError => e
              puts forcast
              #print_exception(e, true)
              next
          end

          existing_forcast = Forecast.where("spot_id = ? AND date = ? AND time_slot = ?", current_spot.id, hash_forecast[:date], hash_forecast[:time_slot].to_s)[0]

          if existing_forcast
            puts "updated"
            existing_forcast.update!(hash_forecast)
          else
            puts "not updated"
            existing_forcast = Forecast.create!(hash_forecast)
          end
          p existing_forcast
          hash_forecast = Hash.new(0)
        end
      end
    end
  end

  def find_direction(dir)
    DIRECTION_TRANSLATIONS.each do |num, car|
      if num === dir
        return car
      end
    end
  end

  def round_to_integer(num)
    num.round(0)
  end

  def round_to_one_decimal(num)
    num.round(1)
  end
end
