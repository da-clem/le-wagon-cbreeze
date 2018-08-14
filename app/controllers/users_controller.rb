class UsersController < ApplicationController

  def settings
    authorize current_user
  end
end
