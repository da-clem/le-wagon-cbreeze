class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    unless current_user.nil?
      redirect_to forecasts_path
    end
  end
end
