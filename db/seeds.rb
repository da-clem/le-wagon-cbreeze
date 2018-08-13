# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# USERS

puts 'Cleaning spots database...'
Spot.destroy_all
puts 'Cleaning forecasts database...'
Forecast.destroy_all
puts 'Cleaning users database...'
User.destroy_all

# Users
puts 'Creating users...'
users_attributes = [
  {
    email:                'begginer@gmail.com',
    password:             'password',
    name:                 'begginer',
    pref_wind_speed_min:  10.0,
    pref_wind_speed_max:  20.0,
    pref_wave_height_max: 0.5,
    pref_wave_height_min: 0.0
  },
  {
    email:                'intermediate@gmail.com',
    password:             'password',
    name:                 'intermediate',
    pref_wind_speed_min:  15.0,
    pref_wind_speed_max:  30.0,
    pref_wave_height_max: 1.0,
    pref_wave_height_min: 0.0
  },
  {
    email:                'advanced@gmail.com',
    password:             'password',
    name:                 'advanced',
    pref_wind_speed_min:  20.0,
    pref_wind_speed_max:  40.0,
    pref_wave_height_max: 3.0,
    pref_wave_height_min: 0.0
  },
]
User.create!(users_attributes)
puts 'Finished!'

# Spots
puts 'Creating spots...'
spots_attributes = [
  {
    name:       'Viana do Castelo',
    country:    'Portugal',
    latitude:   41.67906,
    longitude:  -8.83401
  },
  {
    name:       'Guincho',
    country:    'Portugal',
    latitude:   38.7342,
    longitude:  -9.4745
  },
  {
    name:       'Nazare',
    country:    'Portugal',
    latitude:   39.6073,
    longitude:  -9.08736
  },
  {
    name:       'Fonte de Telha',
    country:    'Portugal',
    latitude:   38.57286,
    longitude:  -9.19993
  },
  {
    name:       'Carrapateira',
    country:    'Portugal',
    latitude:   37.20085,
    longitude:  -8.90313
  },
  {
    name:       'Tarifa',
    country:    'Spain',
    latitude:   36.03216,
    longitude:  -5.63272
  },
  {
    name:       'Sotogrande',
    country:    'Spain',
    latitude:   36.28276,
    longitude:  -5.27565
  },
  {
    name:       'Oliva',
    country:    'Spain',
    latitude:   38.90384,
    longitude:  -0.05986
  },
  {
    name:       'Leucate',
    country:    'France',
    latitude:   42.94121,
    longitude:  3.03992
  },
  {
    name:       'Lacanau',
    country:    'France',
    latitude:   44.99812,
    longitude:  -1.20291
  },
  {
    name:       'Hayling Island',
    country:    'England',
    latitude:   50.78438,
    longitude:  -1.0013
  },
  {
    name:       'La Panne',
    country:    'Belgium',
    latitude:   51.10503,
    longitude:  2.58702
  },
]
Spot.create!(spots_attributes)
puts 'Finished!'

# Forecasts

puts 'Creating forecasts...'
forecasts_attributes = [
  {
    date:               "24082018",
    spot_id:            Spot.find_by(name: 'Guincho').id,
    time_slot:          "16:00",
    wind_speed:         20.2,
    wind_direction:     346.5,
    wind_gust:          25.2,
    wave_heigth:        2.5,
    wave_direction:     322.4,
    wave_period:        10.7,
    temperature:        25.92,
    weather_code:       "cloudy"
  },
  {
    date:               "24082018",
    spot_id:            Spot.find_by(name: 'Guincho').id,
    time_slot:          "17:00",
    wind_speed:         20.2,
    wind_direction:     346.5,
    wind_gust:          25.2,
    wave_heigth:        2.5,
    wave_direction:     322.4,
    wave_period:        10.7,
    temperature:        25.92,
    weather_code:       "cloudy"
  },
  {
    date:               "24082018",
    spot_id:            Spot.find_by(name: 'Guincho').id,
    time_slot:          "18:00",
    wind_speed:         20.2,
    wind_direction:     346.5,
    wind_gust:          25.2,
    wave_heigth:        2.5,
    wave_direction:     322.4,
    wave_period:        10.7,
    temperature:        25.92,
    weather_code:       "cloudy"
  },
  {
    date:               "24082018",
    spot_id:            Spot.find_by(name: 'Guincho').id,
    time_slot:          "19:00",
    wind_speed:         20.2,
    wind_direction:     346.5,
    wind_gust:          25.2,
    wave_heigth:        2.5,
    wave_direction:     322.4,
    wave_period:        10.7,
    temperature:        25.92,
    weather_code:       "cloudy"
  },
]
Forecast.create!(forecasts_attributes)
puts 'Finished!'

