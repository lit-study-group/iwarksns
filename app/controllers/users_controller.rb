class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    user.save
    redirect_to root_url
  end

  private
    #strong parameter
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
