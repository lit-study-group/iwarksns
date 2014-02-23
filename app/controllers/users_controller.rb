class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @posts = @user.posts
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to root_url
  end

  private
    #strong parameter
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)

    def set_user
      @user = User.find(params[:id])
    end
end
