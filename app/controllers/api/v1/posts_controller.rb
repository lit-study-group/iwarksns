class Api::V1::PostsController < Api::ApplicationController
  def index
    @posts = Post.for_user(current_user)
  end

  def create
  end

  def destroy
  end
end
