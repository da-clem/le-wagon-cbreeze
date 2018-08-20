class UsersController < ApplicationController

  def settings
    authorize current_user
    @favorite_spot = FavoriteSpot.new
    @spots = Spot.all
  end

  def change
    respond_to do |format|
        format.js  {
          authorize current_user
          puts "heeeeeeeyp"
          puts params
          if current_user.update(user_params)
            puts "updated"
          else
            render :edit
          end
        }
    end
  end

  private

  def user_params
    params.require(:user).permit(:pref_wind_speed_min, :pref_wind_speed_max, :pref_wave_height_min, :pref_wave_height_max)
  end
end
