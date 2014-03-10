class Api::ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def user_signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(token: params[:token])
  end

  def authenticate_user!
    render 'api/errors/auth', status: 403 unless user_signed_in?
  end

end
