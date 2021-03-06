class Topics::PostsController < ApplicationController
  #def index
    #@posts = Post.all
    #authorize @posts
  #end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @comments = @post.comments
    authorize @topic
  end
  
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end
  
  def create
    #@post = Post.new(post_params)
    #@post = Post.params.require(:post).permit(:title, :body))
    #@post = current_user.posts.build(params.require(:post).permit(:title, :body))
    
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = Topic.find(params[:topic_id])
    authorize @post
    
    #if @post.save
    if @post.save_with_initial_vote
      #@post.create_vote
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @post.save
    authorize @post
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    #@post = current_user.posts.build(post_params)
    authorize @post
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
  
  def destroy
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post
 
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to @topic
     else
       flash[:error] = "There was an error deleting the post."
       render :show
     end
   end
  
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
