class FavoriteSpotsController < ApplicationController
  def create
    @favorite_spot = FavoriteSpot.new(favorite_spot_params)
    @favorite_spot.user = current_user
    authorize @favorite_spot

    if @favorite_spot.save
      redirect_to settings_users_path
    else
      #render :new
    end
  end

  def destroy
  end

  private

  def favorite_spot_params
    params.require(:favorite_spot).permit(:spot_id)
  end
end
