class CommentsController < ApplicationController
  def create
    Comment.create(comments_params)
    @post = Post.find(comments_params[:post_id])
    @post_comments = @post.comments
    #todo  Render as Js with create.js.erb
    redirect_to user_feed_path(id: current_user.id, feed_id: params[:id])
  end
  
  def destroy
    comment = Comment.find(params[:comment_id])
    comment.delete
    redirect_to user_feed_path(id: current_user.id, feed_id: params[:id])
  end
  
  private
  def comments_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
  
end
