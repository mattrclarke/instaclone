class FeedController < ApplicationController
  def show
    @post = Post.new
    @posts = Post.where(user_id: @current_user.id).reverse
    @comment = Comment.new
  end
  
  def index
    # If profile relationships were made use something like this:
    # and scope the following_posts query out on the model
    # @posts = Profile.following_posts
    @posts = Post.all
  end
end
