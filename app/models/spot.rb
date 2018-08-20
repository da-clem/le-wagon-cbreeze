class Spot < ApplicationRecord
  has_many :favorite_spots, :dependent => :destroy
  has_many :forecasts, :dependent => :destroy
  has_many :users, through: :favorite_spots
  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :country, presence: true
  # reverse_geocoded_by :latitude, :longitude
end
