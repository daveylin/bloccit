class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = Post.find(params[:post_id])
    @comment.user = current_user
    #authorize @comment
    if @comment.save
       redirect_to [@topic, @post], notice: "Comment was saved successfully."
     else
       flash[:error] = "Error creating comment. Please try again."
       render :new
     end
   end
  
   def destroy
     @post = Post.find(params[:post_id])
     @topic = @post.topic
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
   end
end