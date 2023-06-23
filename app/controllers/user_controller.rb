class UserController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    # render 'index', locals: { placeholder_text: 'Here is a list of all users' }
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @recent_posts = @user.posts.recent.limit(10) if @user.present?
  end

  def edit
    @user = User.find(params[:id])
  end
end
