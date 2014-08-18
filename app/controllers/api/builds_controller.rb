class Api::BuildsController < ApplicationController
  
  before_filter :fetch_app
  before_filter :fetch_build, :except => [:index, :create]

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

  def create
    @build = Build.create(build_params)
    @build.app = @app
    if @build.save
      render json: @build
    else
      render json: @build.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def build_params
      params.require(:build).permit(:apk)
    end

end
