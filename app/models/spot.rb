class Spot < ApplicationRecord
  has_many :forecasts
  has_many :users, through :favorite_spots
  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :country, presence: true
end
