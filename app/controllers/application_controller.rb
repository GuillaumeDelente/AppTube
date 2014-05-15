class ApplicationController < ActionController::Base

  respond_to :json
  protect_from_forgery with: :null_session
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  private

  def authenticate_user_from_token!
    user_token = params[:user_token].presence
    user = user_token && User.find_by_user_token(user_token)

    if user && Devise.secure_compare(user.secret_token, params[:secret_token])
      sign_in user, store: false
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
