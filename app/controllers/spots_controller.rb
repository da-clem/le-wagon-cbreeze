class SpotsController < ApplicationController
  def index
    @spots = policy_scope(Spot)

    @spots = Spot.where.not(latitude: nil, longitude: nil)

    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end
end
