class Api::ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!

  def user_signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(token: params[:token]) if params[:token]
  end

  def authenticate_user!
    render 'api/common/auth_error', status: 403 unless user_signed_in?
  end

end
