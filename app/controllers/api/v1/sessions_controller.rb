class Api::V1::SessionsController < Api::ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @user = User.find_by(email: params[:user][:email]) if params[:user]
    if @user && @user.authenticate(params[:user][:password])
      @user.initialize_token!
      render @user
    else
      render 'api/common/login_error', status: 403
    end
  end

end
