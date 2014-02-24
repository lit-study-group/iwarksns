class PostsController < ApplicationController
  before_action :set_post, only: [:destroy]
  before_action :check_user!, only: [:destroy]

  def index
    @post = Post.new
    @posts = Post.for_user(current_user)
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: 'Post created'
    else
      render :index
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def check_user!
    if current_user.id != @post.user_id
      redirect_to root_path
    end
  end
end
