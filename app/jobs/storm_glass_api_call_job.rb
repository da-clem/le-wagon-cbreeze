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

    endTS = (Time.now.beginning_of_day+5.days).to_i

    url = 'https://api.stormglass.io/point?lat=38.7342&lng=-9.4745&params=airTemperature,waveHeight,gust,waveDirection,wavePeriod,windDirection,windSpeed&end=' + endTS.to_s
    data_serialized = open(url, "Authorization" => "e2b60dd4-8f9c-11e8-83ef-0242ac130004-e2b60fdc-8f9c-11e8-83ef-0242ac130004").read
    data = JSON.parse(data_serialized)

    #file = File.read('app/jobs/baba.json')
    #data = JSON.parse(file)

    hash_forecast = Hash.new(0)

    data["hours"].each do |forcast|
      timestamp = Time.parse(forcast["time"])
      if (8..19).include?(timestamp.hour)
        forcast.each do |key, value|
          hash_forecast[key] += value.detect{|h| h["source"]=="sg"}["value"] if value.kind_of?(Array) && !value.empty?
        end
      end
      if [11, 15, 19].include? timestamp.hour
        hash_forecast = Hash[hash_forecast.map { |key, value| [API_TRANSLATIONS[key], value/4] }]
        hash_forecast[:wind_direction] = find_direction(hash_forecast[:wind_direction])
        hash_forecast[:wave_direction] = find_direction(hash_forecast[:wave_direction])
        p hash_forecast
        hash_forecast[:spot_id] = Spot.find_by(name: 'Guincho').id
        hash_forecast[:time_slot] = timestamp.hour
        hash_forecast[:date] = forcast["time"].split('T')[0]
        fc = Forecast.create(hash_forecast)
        puts fc
        hash_forecast = Hash.new(0)
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

end
