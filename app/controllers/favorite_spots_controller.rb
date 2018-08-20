class FavoriteSpotsController < ApplicationController
  def create
    @favorite_spot = FavoriteSpot.new(favorite_spot_params)
    @favorite_spot.user = current_user
    authorize @favorite_spot

    if @favorite_spot.save
      redirect_to settings_users_path
    else
      render settings_users_path
    end
  end

  def destroy
    @favorite_spot = FavoriteSpot.where(spot_id: params[:id], user_id: current_user)
    authorize @favorite_spot

    @favorite_spot.destroy_all
    redirect_to settings_users_path
  end

  private

  def favorite_spot_params
    params.require(:favorite_spot).permit(:spot_id)
  end
end
