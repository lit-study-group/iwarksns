class PostsController < ApplicationController
  before_action :set_post, only: [:destroy]
  before_action :check_user, only: [:destroy]

  def index
    @post = Post.new
    @posts = Post.for_user(current_user)
  end

  def create
    @post = Post.new(post_param)
    if @post.save
      redirect_to root_path, notice: 'Post created'
    else
      flash[:error] = 'Could not create post'
      render :index
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private
  def post_param
    params.require(:post).permit(:body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def check_user
    if current_user.id != @post.user_id
      redirect_to root_path
    end
  end
end
