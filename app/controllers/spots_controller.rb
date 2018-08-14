class SpotsController < ApplicationController
  def index
    @spots = policy_scope(Spot)
  end
end
