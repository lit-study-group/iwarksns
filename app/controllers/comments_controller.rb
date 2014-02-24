class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:destroy]
  before_action :check_user!, only: [:destroy]

  def create
    @comment = current_user.comments.create(comment_params.merge({ post_id: @post.id }))
    if @comment.save
      redirect_to root_path, saved: 'comment.saved'
    else
      redirect_to root_path, error: 'comment.not_saved'
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def check_user!
    redirect_to root_path unless current_user.owns_comment?(@comment)
  end
end
