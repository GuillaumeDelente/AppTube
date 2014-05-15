class Api::AppsController < ApplicationController

  def index
    @apps = current_user.apps
    render json: @apps
  end

end
