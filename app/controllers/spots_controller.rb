class SpotsController < ApplicationController
  def index
    @spots = policy_scope(Spot)

    @spots = Spot.where.not(latitude: nil, longitude: nil)

    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: {
            content: render_to_string(partial: "/shared/info_window", locals: { spot: spot }) },
        icon: { url: maps_icon_helper(current_user, spot) },
      }
    end
  end

  def maps_icon_helper(current_user, spot)

    if current_user.favorite_spots.exists?(spot_id: spot.id)
      return "http://res.cloudinary.com/cbreeze/image/upload/c_scale,w_25/v1534932112/location-pin_1.png"
    else
       return "http://res.cloudinary.com/cbreeze/image/upload/c_scale,w_25/v1534875524/location-pin.png"
    end
  end
end





