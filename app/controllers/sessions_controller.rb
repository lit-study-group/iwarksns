class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only:[:create]

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.try(:authenticate, params[:user][:password])
      login(@user)
      redirect_to root_path
    else
      @user = User.new
      @user.errors.add(:base, 'errors.login')
      render 'welcome/index'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to anonymous_root_path
  end

end
