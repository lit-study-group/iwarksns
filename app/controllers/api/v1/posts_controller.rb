class Api::V1::PostsController < Api::ApplicationController
  before_action :set_post, only: :destroy
  before_action :check_user!, only: :destroy

  def index
    @posts = current_user.posts
                         .offset(params[:offset])
                         .limit(20)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      render @post
    else
      render 'api/v1/posts/error', status: 403
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def check_user!
    render 'api/errors/unauthorized' if current_user.id != @post.id
  end
end
