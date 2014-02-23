class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only:[:create]
  before_action :set_user, only: [:show]

  def show
    @posts = @user.posts
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      redirect_to @new_user
    else
      render 'welcome/index'
    end
  end

  private
    #strong parameter
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
