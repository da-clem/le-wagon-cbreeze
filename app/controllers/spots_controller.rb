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
        icon: { url: "http://res.cloudinary.com/cbreeze/image/upload/c_scale,w_20/v1534859348/kitesurf.png" }
      }
    end
  end
end




