class Forecast < ApplicationRecord
  belongs_to :spot
  has_many :sessions, :dependent => :destroy
end
