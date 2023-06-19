class CommentController < ApplicationController
  before_action :set_user
  def new
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.first

    begin
      @comment = Comment.new(comment_params)
    rescue ActionController::ParameterMissing
      redirect_to root_path, alert: 'Invalid request parameters.'
      return
    end

    @comment.post = @post

    if @comment.save
      flash[:notice] = 'Comment added successfully!'
      @comment.update_comments_counter
      redirect_to user_post_path(current_user.id, @post.id)
    else
      flash[:alert] = "Couldn't create Comment!"
      render :new
    end
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :comment)
  end
end
