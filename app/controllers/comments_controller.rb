class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    #@topic = Topic.find(params[:topic_id])
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = Post.find(params[:post_id])
    @comment.user = current_user
    authorize @comment
    if @comment.save
       redirect_to [@post.topic, @post], notice: "Comment was saved successfully."
     else
       flash[:error] = "Error creating comment. Please try again."
       render :new
     end
   end
  
   def destroy
     #@topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
     end
     
     respond_to do |format|
       format.html
       format.js
     end
   end
  
end