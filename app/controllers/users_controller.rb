class UsersController < ApplicationController

  def settings
    authorize current_user
    @favorite_spot = FavoriteSpot.new
    @spots = Spot.all
  end
end
