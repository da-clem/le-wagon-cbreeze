class FavoriteSpot < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :spot, uniqueness: { scope: :user, message: "already in favorites" }
end
