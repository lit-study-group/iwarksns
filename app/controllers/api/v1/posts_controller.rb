class Api::V1::PostsController < Api::ApplicationController

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
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end
end
