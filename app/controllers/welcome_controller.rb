class WelcomeController < ApplicationController
  skip_before_action :check_logined
  before_action :check_welcome_logined, only:[:index]

  def index
    @user = User.new
  end

  private

  def check_welcome_logined
    redirect_to current_user if current_user
  end
end
