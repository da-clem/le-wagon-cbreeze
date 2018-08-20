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
    name:       'Esposende',
    country:    'Portugal',
    latitude:   41.53965,
    longitude:  -8.7924
  },
  {
    name:       'Costa Nova',
    country:    'Portugal',
    latitude:   40.61909,
    longitude:  -8.75483
  },
  {
    name:       'Figueira da Foz',
    country:    'Portugal',
    latitude:   40.15368,
    longitude:  -8.87695
  },
  {
    name:       'Peniche - North',
    country:    'Portugal',
    latitude:   39.37459,
    longitude:  -9.33639
  },
  {
    name:       'Peniche - South',
    country:    'Portugal',
    latitude:   39.34118,
    longitude:  -9.36271
  },
  {
    name:       'Ericeira',
    country:    'Portugal',
    latitude:   38.94297,
    longitude:  -9.41687
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
    name:       'Costa Caparica',
    country:    'Portugal',
    latitude:   38.57286,
    longitude:  -9.19993
  },
 {
    name:       'Lagoa de Albufeira',
    country:    'Portugal',
    latitude:   38.50878,
    longitude:  -9.18452
  },
  {
    name:       'Carrapateira',
    country:    'Portugal',
    latitude:   37.20085,
    longitude:  -8.90313
  },
  {
    name:       'Alvor',
    country:    'Spain',
    latitude:   37.12087,
    longitude:  -8.61332
  },
  {
    name:       'Caños de Meca',
    country:    'Spain',
    latitude:   36.18581,
    longitude:  -6.0267
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
    name:       'Flag Beach',
    country:    'Spain',
    latitude:   28.72423,
    longitude:  -13.83629
  },
  {
    name:       'Flag Beach',
    country:    'Spain',
    latitude:   28.72423,
    longitude:  -13.83629
  },
  {
    name:       'Sotavento',
    country:    'Spain',
    latitude:   28.13799,
    longitude:  -14.23587
  },
  {
    name:       'El Medano',
    country:    'Spain',
    latitude:   28.04099,
    longitude:  -16.54164
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
    name:       'Lancing',
    country:    'England',
    latitude:   50.81966,
    longitude:  -0.32041
  },
  {
    name:       'Woolacombe',
    country:    'England',
    latitude:   51.17202,
    longitude:  -4.21978
  },
  {
    name:       'St Andrews',
    country:    'Scotland',
    latitude:   56.35688,
    longitude:  -2.80391
  },
  {
    name:       'Gwithian',
    country:    'England',
    latitude:   50.2281,
    longitude:  -5.3954
  },
  {
    name:       'La Panne',
    country:    'Belgium',
    latitude:   51.10503,
    longitude:  2.58702
  },
  {
    name:       'Terschelling',
    country:    'Netherlands',
    latitude:   53.42712,
    longitude:  5.31738
  },
  {
    name:       'Dakhla',
    country:    'Morroco',
    latitude:   23.76545,
    longitude:  -15.92354
  },
  {
    name:       'Essaouira',
    country:    'Morroco',
    latitude:   31.49949,
    longitude:  -9.76731
  },
  {
    name:       'Ponta Preta',
    country:    'Cape Verde',
    latitude:   16.60512,
    longitude:  -22.93011
  },
  {
    name:       'Preá',
    country:    'Brazil',
    latitude:   -2.8116,
    longitude:  -40.41659
  },
  {
    name:       'Cape Town',
    country:    'South Africa',
    latitude:   -33.82094,
    longitude:  18.47316
  },
  {
    name:       'One Eye',
    country:    'Mauritius',
    latitude:   -20.4665,
    longitude:  57.30185
  },
  {
    name:       'Ocean Beach (SF)',
    country:    'California',
    latitude:   37.76582,
    longitude:  -122.51481
  },
  {
    name:       'Naxos',
    country:    'Greece',
    latitude:   36.99792,
    longitude:  25.3879
  },
  {
    name:       'Paros',
    country:    'Greece',
    latitude:   37.02991,
    longitude:  25.09708
  },
  {
    name:       'Sardinia',
    country:    'Italy',
    latitude:   39.28749,
    longitude:  8.43503
  },
]
Spot.create!(spots_attributes)
puts 'Finished!'

StormGlassApiCallJob.perform_now

# Forecasts
puts 'Finished!'

