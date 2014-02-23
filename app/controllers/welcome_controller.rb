class WelcomeController < ApplicationController
  skip_before_action :check_logined

  def index
    @user = User.new
  end
end
