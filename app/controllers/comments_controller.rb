class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = Post.find(params[:post_id])
    @comment.user = current_user
    authorize @comment
    if @comment.save
       redirect_to [@topic, @post], notice: "Comment was saved successfully."
     else
       flash[:error] = "Error creating comment. Please try again."
       render :new
     end
   end
end