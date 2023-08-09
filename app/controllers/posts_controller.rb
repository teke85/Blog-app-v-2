# controller for handling posts
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments) # Eager load comments for each post
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc).limit(5) # Fetch 5 most recent comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = @current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(@current_user)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
