class Session < ApplicationRecord
  belongs_to :forecast
  belongs_to :user
end
