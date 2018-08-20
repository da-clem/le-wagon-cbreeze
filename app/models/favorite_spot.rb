class FavoriteSpot < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :spot, uniqueness: { scope: :user, message: "Spot already in favorites" }
end
