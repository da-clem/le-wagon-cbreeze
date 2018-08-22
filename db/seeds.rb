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
    longitude:  -8.83401,
    timezone:   'Europe/Lisbon'
  },
  {
    name:       'Esposende',
    country:    'Portugal',
    latitude:   41.53965,
    longitude:  -8.7924,
    timezone:   'Europe/Lisbon'
  },
  {
    name:       'Costa Nova',
    country:    'Portugal',
    latitude:   40.61909,
    longitude:  -8.75483,
    timezone:   'Europe/Lisbon'
  },
  {
    name:       'Figueira da Foz',
    country:    'Portugal',
    latitude:   40.15368,
    longitude:  -8.87695,
    timezone:   'Europe/Lisbon'
  },
  {
    name:       'Peniche - North',
    country:    'Portugal',
    latitude:   39.37459,
    longitude:  -9.33639,
    timezone:   'Europe/Lisbon'
  },
  {
    name:       'Peniche - South',
    country:    'Portugal',
    latitude:   39.34118,
    longitude:  -9.36271,
    timezone:   'Europe/Lisbon'
  },
  {
    name:       'Ericeira',
    country:    'Portugal',
    latitude:   38.94297,
    longitude:  -9.41687,
    timezone:   'Europe/Lisbon'
  },
  {
    name:       'Guincho',
    country:    'Portugal',
    latitude:   38.7342,
    longitude:  -9.4745,
    timezone:   'Europe/Lisbon'
  },
  {
    name:       'Nazare',
    country:    'Portugal',
    latitude:   39.6073,
    longitude:  -9.08736,
    timezone:   'Europe/Lisbon'
  },
  {
    name:       'Costa Caparica',
    country:    'Portugal',
    latitude:   38.57286,
    longitude:  -9.19993,
    timezone:   'Europe/Lisbon'
  },
 {
    name:       'Lagoa de Albufeira',
    country:    'Portugal',
    latitude:   38.50878,
    longitude:  -9.18452,
    timezone:   'Europe/Lisbon'
  },
  {
    name:       'Carrapateira',
    country:    'Portugal',
    latitude:   37.20085,
    longitude:  -8.90313,
    timezone:   'Europe/Lisbon'
  },
  {
    name:       'Alvor',
    country:    'Portugal',
    latitude:   37.12087,
    longitude:  -8.61332,
    timezone:   'Europe/Lisbon'
  },
  {
    name:       'Caños de Meca',
    country:    'Spain',
    latitude:   36.18581,
    longitude:  -6.0267,
    timezone:   'Europe/Madrid'

  },
  {
    name:       'Tarifa',
    country:    'Spain',
    latitude:   36.03216,
    longitude:  -5.63272,
    timezone:   'Europe/Madrid'
  },
  {
    name:       'Sotogrande',
    country:    'Spain',
    latitude:   36.28276,
    longitude:  -5.27565,
    timezone:   'Europe/Madrid'
  },
  {
    name:       'Oliva',
    country:    'Spain',
    latitude:   38.90384,
    longitude:  -0.05986,
    timezone:   'Europe/Madrid'
  },
  {
    name:       'Flag Beach',
    country:    'Spain',
    latitude:   28.72423,
    longitude:  -13.83629,
    timezone:   'Europe/Madrid'
  },
  {
    name:       'Fromentine',
    country:    'France',
    latitude:   46.90594,
    longitude:  -2.17563,
    timezone:   'Europe/Madrid'
  },
  {
    name:       'Sotavento',
    country:    'Spain',
    latitude:   28.13799,
    longitude:  -14.23587,
    timezone:   'Europe/Madrid'
  },
  {
    name:       'El Medano',
    country:    'Spain',
    latitude:   28.04099,
    longitude:  -16.54164,
    timezone:   'Europe/Madrid'
  },
  {
    name:       'Leucate',
    country:    'France',
    latitude:   42.94121,
    longitude:  3.03992,
    timezone:   'Europe/Paris'

  },
  {
    name:       'Lacanau',
    country:    'France',
    latitude:   44.99812,
    longitude:  -1.20291,
    timezone:   'Europe/Paris'
  },
  {
    name:       'Hayling Island',
    country:    'England',
    latitude:   50.78438,
    longitude:  -1.0013,
    timezone:   'Europe/London'
  },
  {
    name:       'Lancing',
    country:    'England',
    latitude:   50.81966,
    longitude:  -0.32041,
    timezone:   'Europe/London'
  },
  {
    name:       'Woolacombe',
    country:    'England',
    latitude:   51.17202,
    longitude:  -4.21978,
    timezone:   'Europe/London'
  },
  {
    name:       'St Andrews',
    country:    'Scotland',
    latitude:   56.35688,
    longitude:  -2.80391,
    timezone:   'Europe/London'
  },
  {
    name:       'Gwithian',
    country:    'England',
    latitude:   50.2281,
    longitude:  -5.3954,
    timezone:   'Europe/London'
  },
  {
    name:       'La Panne',
    country:    'Belgium',
    latitude:   51.10503,
    longitude:  2.58702,
    timezone:   'Europe/Brussels'
  },
  {
    name:       'Terschelling',
    country:    'Netherlands',
    latitude:   53.42712,
    longitude:  5.31738,
    timezone:   'Europe/Amsterdam'
  },
  {
    name:       'Dakhla',
    country:    'Morroco',
    latitude:   23.76545,
    longitude:  -15.92354,
    timezone:   'Africa/Casablanca'
  },
  {
    name:       'Essaouira',
    country:    'Morroco',
    latitude:   31.49949,
    longitude:  -9.76731,
    timezone:   'Africa/Casablanca'
  },
  {
    name:       'Ponta Preta',
    country:    'Cape Verde',
    latitude:   16.60512,
    longitude:  -22.93011,
    timezone:   'Atlantic/Cape_Verde'
  },
  {
    name:       'Preá',
    country:    'Brazil',
    latitude:   -2.8116,
    longitude:  -40.41659,
    timezone:   'America/Fortaleza'

  },
  {
    name:       'Cape Town',
    country:    'South Africa',
    latitude:   -33.82094,
    longitude:  18.47316,
    timezone:   'Africa/Johannesburg'
  },
  {
    name:       'One Eye',
    country:    'Mauritius',
    latitude:   -20.4665,
    longitude:  57.30185,
    timezone:   'Indian/Mauritius'

  },
  {
    name:       'Ocean Beach (SF)',
    country:    'California',
    latitude:   37.76582,
    longitude:  -122.51481,
    timezone:   'America/Los_Angeles'
  },
  {
    name:       'Naxos',
    country:    'Greece',
    latitude:   36.99792,
    longitude:  25.3879,
    timezone:   'Europe/Athens'
  },
  {
    name:       'Paros',
    country:    'Greece',
    latitude:   37.02991,
    longitude:  25.09708,
    timezone:   'Europe/Athens'
  },
  {
    name:       'Sardinia',
    country:    'Italy',
    latitude:   39.28749,
    longitude:  8.43503,
    timezone:   'Europe/Rome'
  },
  {
    name:       'Cabarete',
    country:    'Dominican Republic',
    latitude:   19.76597,
    longitude:  -70.41978,
    timezone:   'America/Santo_Domingo'
  },
  {
    name:       'Fehmarn',
    country:    'Germany',
    latitude:   54.42831,
    longitude:  11.08657,
    timezone:   'Europe/Berlin'
  },
  {
    name:       'Tollerstranda',
    country:    'Norway',
    latitude:   59.33295,
    longitude:  10.66275,
    timezone:   'Europe/Oslo'
  },
  {
    name:       'Hookipa Beach',
    country:    'Hawaii',
    latitude:   20.9353,
    longitude:  -156.36141,
    timezone:   'Pacific/Honolulu'
  },
  {
    name:       'El Gouna',
    country:    'Egypt',
    latitude:   27.42145,
    longitude:  33.67858,
    timezone:   'Africa/Cairo'
  },
  {
    name:       'El Gouna',
    country:    'Egypt',
    latitude:   -12.18762,
    longitude:  49.35683,
    timezone:   'Africa/Cairo'
  },
  {
    name:       'Paje',
    country:    'Zanzibar',
    latitude:   -6.27059,
    longitude:  39.54597,
    timezone:   'Africa/Dar_es_Salaam'
  },
  {
    name:       'Long Bay',
    country:    'Turks and Caicos',
    latitude:   21.79313,
    longitude:  -72.14756,
    timezone:   'America/Grand_Turk'
  },
  {
    name:       'Cape Hatteras',
    country:    'North Carolina',
    latitude:   35.22697,
    longitude:  -75.61752,
    timezone:   'America/New_York'
  },
  {
    name:       'La Ventana',
    country:    'Mexico',
    latitude:   24.06183,
    longitude:  -109.98915,
    timezone:   'America/Mazatlan'
  },
]
Spot.create!(spots_attributes)
puts 'Finished!'

StormGlassApiCallJob.perform_now
puts 'Finished Stormglass'

OpenweathermapJob.perform_now
puts 'Finished Openweathermap'
