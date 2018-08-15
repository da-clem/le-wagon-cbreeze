class SessionsController < ApplicationController
  def create
  end

  def destroy
  end

  def index
    authorize current_user
  end
end
