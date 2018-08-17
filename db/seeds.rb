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

StormGlassApiCallJob.perform_now

# Forecasts

# puts 'Creating forecasts...'
# forecasts_attributes = [
#   {
#     date:               "15-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "morning",
#     wind_speed:         10.2,
#     wind_direction:     200.5,
#     wind_gust:          15.2,
#     wave_heigth:        1.5,
#     wave_direction:     322.4,
#     wave_period:        6.7,
#     temperature:        20.92,
#     weather_code:       "01d"
#   },
#   {
#     date:               "15-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "afternoon",
#     wind_speed:         20.2,
#     wind_direction:     346.5,
#     wind_gust:          25.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        10.7,
#     temperature:        25.92,
#     weather_code:       "02d"
#   },
#   {
#     date:               "15-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "evening",
#     wind_speed:         25.2,
#     wind_direction:     346.5,
#     wind_gust:          30.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        12.7,
#     temperature:        22.92,
#     weather_code:       "03d"
#   },
#    {
#     date:               "16-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "morning",
#     wind_speed:         10.2,
#     wind_direction:     200.5,
#     wind_gust:          15.2,
#     wave_heigth:        1.5,
#     wave_direction:     322.4,
#     wave_period:        6.7,
#     temperature:        20.92,
#     weather_code:       "04d"
#   },
#   {
#     date:               "16-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "afternoon",
#     wind_speed:         20.2,
#     wind_direction:     346.5,
#     wind_gust:          25.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        10.7,
#     temperature:        25.92,
#     weather_code:       "09d"
#   },
#   {
#     date:               "16-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "evening",
#     wind_speed:         25.2,
#     wind_direction:     346.5,
#     wind_gust:          30.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        12.7,
#     temperature:        22.92,
#     weather_code:       "10d"
#   },
#   {
#     date:               "17-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "morning",
#     wind_speed:         10.2,
#     wind_direction:     200.5,
#     wind_gust:          15.2,
#     wave_heigth:        1.5,
#     wave_direction:     322.4,
#     wave_period:        6.7,
#     temperature:        20.92,
#     weather_code:       "11d"
#   },
#   {
#     date:               "17-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "afternoon",
#     wind_speed:         20.2,
#     wind_direction:     346.5,
#     wind_gust:          25.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        10.7,
#     temperature:        25.92,
#     weather_code:       "13d"
#   },
#   {
#     date:               "17-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "evening",
#     wind_speed:         25.2,
#     wind_direction:     346.5,
#     wind_gust:          30.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        12.7,
#     temperature:        22.92,
#     weather_code:       "50d"
#   },
#   {
#     date:               "18-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "morning",
#     wind_speed:         10.2,
#     wind_direction:     200.5,
#     wind_gust:          15.2,
#     wave_heigth:        1.5,
#     wave_direction:     322.4,
#     wave_period:        6.7,
#     temperature:        20.92,
#     weather_code:       "01d"
#   },
#   {
#     date:               "18-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "afternoon",
#     wind_speed:         20.2,
#     wind_direction:     346.5,
#     wind_gust:          25.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        10.7,
#     temperature:        25.92,
#     weather_code:       "02d"
#   },
#   {
#     date:               "18-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "evening",
#     wind_speed:         25.2,
#     wind_direction:     346.5,
#     wind_gust:          30.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        12.7,
#     temperature:        22.92,
#     weather_code:       "03d"
#   },
#   {
#     date:               "19-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "morning",
#     wind_speed:         30.2,
#     wind_direction:     300.5,
#     wind_gust:          35.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        10,
#     temperature:        20.92,
#     weather_code:       "01d"
#   },
#   {
#     date:               "19-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "afternoon",
#     wind_speed:         30.2,
#     wind_direction:     300.5,
#     wind_gust:          35.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        10,
#     temperature:        20.92,
#     weather_code:       "01d"
#   },
#   {
#     date:               "19-08-2018",
#     spot_id:            Spot.find_by(name: 'Guincho').id,
#     time_slot:          "evening",
#     wind_speed:         30.2,
#     wind_direction:     300.5,
#     wind_gust:          35.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        10,
#     temperature:        20.92,
#     weather_code:       "01d"
#   },
#   {
#     date:               "15-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "morning",
#     wind_speed:         10.2,
#     wind_direction:     200.5,
#     wind_gust:          15.2,
#     wave_heigth:        1.5,
#     wave_direction:     322.4,
#     wave_period:        6.7,
#     temperature:        20.92,
#     weather_code:       "01d"
#   },
#   {
#     date:               "15-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "afternoon",
#     wind_speed:         20.2,
#     wind_direction:     346.5,
#     wind_gust:          25.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        10.7,
#     temperature:        25.92,
#     weather_code:       "02d"
#   },
#   {
#     date:               "15-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "evening",
#     wind_speed:         25.2,
#     wind_direction:     346.5,
#     wind_gust:          30.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        12.7,
#     temperature:        22.92,
#     weather_code:       "03d"
#   },
#   {
#     date:               "16-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "morning",
#     wind_speed:         10.2,
#     wind_direction:     200.5,
#     wind_gust:          15.2,
#     wave_heigth:        1.5,
#     wave_direction:     322.4,
#     wave_period:        6.7,
#     temperature:        20.92,
#     weather_code:       "04d"
#   },
#   {
#     date:               "16-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "afternoon",
#     wind_speed:         20.2,
#     wind_direction:     346.5,
#     wind_gust:          25.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        10.7,
#     temperature:        25.92,
#     weather_code:       "09d"
#   },
#   {
#     date:               "16-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "evening",
#     wind_speed:         2.2,
#     wind_direction:     100.5,
#     wind_gust:          2.2,
#     wave_heigth:        2.5,
#     wave_direction:     350.4,
#     wave_period:        1.7,
#     temperature:        15.92,
#     weather_code:       "10d"
#   },
#   {
#     date:               "17-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "morning",
#     wind_speed:         2.2,
#     wind_direction:     100.5,
#     wind_gust:          2.2,
#     wave_heigth:        2.5,
#     wave_direction:     350.4,
#     wave_period:        1.7,
#     temperature:        15.92,
#     weather_code:       "01d"
#   },
#   {
#     date:               "17-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "afternoon",
#     wind_speed:         20.2,
#     wind_direction:     346.5,
#     wind_gust:          25.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        10.7,
#     temperature:        25.92,
#     weather_code:       "02d"
#   },
#   {
#     date:               "17-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "evening",
#     wind_speed:         25.2,
#     wind_direction:     346.5,
#     wind_gust:          30.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        12.7,
#     temperature:        22.92,
#     weather_code:       "03d"
#   },
#   {
#     date:               "18-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "morning",
#     wind_speed:         10.2,
#     wind_direction:     200.5,
#     wind_gust:          15.2,
#     wave_heigth:        1.5,
#     wave_direction:     322.4,
#     wave_period:        6.7,
#     temperature:        20.92,
#     weather_code:       "01d"
#   },
#   {
#     date:               "18-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "afternoon",
#     wind_speed:         20.2,
#     wind_direction:     346.5,
#     wind_gust:          25.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        10.7,
#     temperature:        25.92,
#     weather_code:       "02d"
#   },
#   {
#     date:               "18-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "evening",
#     wind_speed:         25.2,
#     wind_direction:     346.5,
#     wind_gust:          30.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        12.7,
#     temperature:        22.92,
#     weather_code:       "03d"
#   },
#   {
#     date:               "19-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "morning",
#     wind_speed:         10.2,
#     wind_direction:     200.5,
#     wind_gust:          15.2,
#     wave_heigth:        1.5,
#     wave_direction:     322.4,
#     wave_period:        6.7,
#     temperature:        20.92,
#     weather_code:       "01d"
#   },
#   {
#     date:               "19-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "afternoon",
#     wind_speed:         20.2,
#     wind_direction:     346.5,
#     wind_gust:          25.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        10.7,
#     temperature:        25.92,
#     weather_code:       "02d"
#   },
#   {
#     date:               "19-08-2018",
#     spot_id:            Spot.find_by(name: 'Nazare').id,
#     time_slot:          "evening",
#     wind_speed:         25.2,
#     wind_direction:     346.5,
#     wind_gust:          30.2,
#     wave_heigth:        2.5,
#     wave_direction:     322.4,
#     wave_period:        12.7,
#     temperature:        22.92,
#     weather_code:       "03d"
#   },
# ]
# Forecast.create!(forecasts_attributes)
puts 'Finished!'

