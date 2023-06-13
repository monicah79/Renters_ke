class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.posts.recent.limit(10)
  end

  def edit
    @user = User.find(params[:id])
  end
end
