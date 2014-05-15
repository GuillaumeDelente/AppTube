class Api::AppsController < ApplicationController
  
  before_filter :fetch_user, :except => [:index]

  def fetch_user
    @app = current_user.apps.find_by_name(params[:id])
    @app || not_found
  end

  def show
    render json: @app
  end

  def index
    render json: current_user.apps
  end

end
