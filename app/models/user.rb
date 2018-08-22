class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :favorite_spots
  has_many :spots, through: :favorite_spots
  has_many :sessions, dependent: :destroy
  validates :pref_wind_speed_min, presence: true, numericality: true
  validates :pref_wind_speed_max, presence: true, numericality: true
  validates :pref_wave_height_min, presence: true, numericality: true
  validates :pref_wave_height_max, presence: true, numericality: true

  after_initialize :set_default, if: :new_record?

  def set_default
    self.pref_wave_height_max = 1.0
    self.pref_wave_height_min = 0
    self.pref_wind_speed_max = 15
    self.pref_wind_speed_min = 5
  end


  def self.find_for_google_oauth2(auth)
    data = auth.info
    user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
    user.access_token = auth.credentials.token
    user.refresh_token = auth.credentials.refresh_token
    user.save
    return user

  end
end
