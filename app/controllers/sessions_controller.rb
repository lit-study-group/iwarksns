class SessionsController < ApplicationController
  skip_before_action :check_logined, only:[:create]
  def create
    user = User.find_by_email(params[:email])
    session[:user_id] = user.id if user && user.authenticate(params[:password])
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end