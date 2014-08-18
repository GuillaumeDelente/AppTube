class Api::AppsController < ApplicationController
  
  before_filter :fetch_app, :except => [:index, :create]

  def fetch_app
    @app = current_user.apps.find_by_name(params[:id])
    @app || not_found
  end

  def show
    render json: @app
  end

  def index
    render json: current_user.apps
  end

  def create
    @app = App.create(app_params)
    current_user.apps << @app
    if @app.save
      render json: @app
    else
      render json: @app.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def app_params
      params.require(:app).permit(:name)
    end
end
