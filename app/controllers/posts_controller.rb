# controller for handling posts
class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts # Initialize the @posts variable with the posts associated with the user
    # Add logging for debugging
    Rails.logger.info("User: #{@user}")
    Rails.logger.info("Posts: #{@posts}")
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.five_most_recent_comments
  end

  def new
    @post = Post.new # Initialize a new post without associating it with the current user
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
