class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only:[:create]

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      login(@new_user)
      redirect_to root_path
    else
      render 'welcome/index'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
