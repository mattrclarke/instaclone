class Feed::FeedShowFacade
  def initialize(current_user:)
    @current_user = current_user
  end
  
  def new_post
    @new_post ||= Post.new
  end
  
  def posts
    @posts ||= Post.where(user_id: @current_user.id).reverse
  end
  
  def new_comment
    @new_comment ||= Comment.new
  end
    
  private
end