class FeedController < ApplicationController
  def show
    @facade = Feed::FeedShowFacade.new(current_user: current_user)
  end
  
  def index
    # If profile relationships were made use something like this:
    # @posts = Profile.following_posts
    # and scope the following_posts query out on the model to get all 
    # the recent posts from who they are following
    @posts = Post.all
  end
end
