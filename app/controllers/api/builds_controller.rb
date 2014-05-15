class Api::BuildsController < ApplicationController
  
  before_filter :fetch_app
  before_filter :fetch_build, :except => [:index]

  def fetch_app
    @app = current_user.apps.find_by_name(params[:app_id])
    @app || not_found
  end

  def fetch_build
    @build = app.find_by_id(params[:id])
    @build || not_found
  end

  def show
    render json: @build
  end

  def index
    render json: @app.builds
  end

end
