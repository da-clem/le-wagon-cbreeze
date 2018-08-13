class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :spots, through: :favorite_spots
  has_many :sessions, dependent: :destroy
  validates :pref_wind_speed_min, presence: true, numericality: true
  validates :pref_wind_speed_max, presence: true, numericality: true
  validates :pref_wave_height_min, presence: true, numericality: true
  validates :pref_wave_height_max, presence: true, numericality: true
end
