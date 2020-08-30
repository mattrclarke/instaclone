class PostsController < ApplicationController
  
  def create
      post = Post.create(
        user_id: params[:user_id],
        feed_id: params[:feed_id]
      )
      post.image.attach(post_params[:image])
      redirect_to user_feed_path(id: params[:feed_id])
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
  
end
