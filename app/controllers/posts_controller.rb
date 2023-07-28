class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts # Assuming there is an association between User and Post models
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
