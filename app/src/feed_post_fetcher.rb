class FeedPostFetcher
  def initialize(current_user:)
    @current_user = current_user
  end

  def run
    posts = Post.where(user_id: @current_user.id).reverse
  end
end