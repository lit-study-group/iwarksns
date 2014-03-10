class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only:[:create]
  before_action :set_user, except: [:index, :create]

  def index
    @users = User.all
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      login(@new_user)
      redirect_to root_path
    else
      render 'welcome/index'
    end
  end

  def friend
    current_user.add_friend(@user) unless current_user.friend?(@user)
    redirect_to :back
  end

  def unfriend
    current_user.remove_friend(@user) if current_user.friend?(@user)
    redirect_to :back
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
