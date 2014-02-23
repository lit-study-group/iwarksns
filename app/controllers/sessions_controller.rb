class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:create]

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      @user.errors.add(:base, 'errors.login')
      render 'welcome/index'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
