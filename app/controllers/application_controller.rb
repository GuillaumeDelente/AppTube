class ApplicationController < ActionController::Base

  respond_to :json
  protect_from_forgery with: :null_session
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  private

  def authenticate_user_from_token!
    user_token = nil
    secret_token = nil
    if request.headers['HTTP_USER_TOKEN'].present?
      user_token = request.headers['HTTP_USER_TOKEN']
      secret_token = request.headers['HTTP_SECRET_TOKEN']
    else
      user_token = params[:user_token]
      secret_token = params[:secret_token]
    end
    user = user_token && User.find_by_user_token(user_token)

    if user && Devise.secure_compare(user.secret_token, secret_token)
      sign_in user, store: false
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
