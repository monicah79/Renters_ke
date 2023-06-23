class PostController < ApplicationController
  # load_and_authorize_resource
  
  before_action :set_user, only: [:index]

  def index
    @posts = Post.all
    @user = User.find_by(id: params[:user_id])
    @user_comments = Comment.where(id: params[:user_id])
    @post_comments = Comment.where(id: params[:user_id])
    render 'index', locals: { placeholder_text: 'This is the post index page' }
  end

  def show
    @post_comments = Comment.where(post_id: @post)
    render 'show', locals: { placeholder_text: 'This is the p
    ost show page' }
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to user_post_path(current_user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to user_post_path(current_user, @post), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path(current_user), notice: 'Post was successfully deleted.'
  end

  def set_user
    @user = User.find_by(id: params[:user_id]) || User.first
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
