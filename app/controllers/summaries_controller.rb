class SummariesController < ApplicationController
  #def index
   #@summaries = Summary.all
    #authorize @summaries
  #end

  def new
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
    authorize @summary
  end

  def show
    @post = Post.find(params[:id])
    #@topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
  end

  def edit
  end
  
    def create
     #@topic = Topic.find(params[:topic_id])
     #@post = current_user.posts.build(post_params)
     @post = Post.find(params[:post_id])
     @summary = Summary.new(params.require(:summary).permit(:name, :details))
      @summary.post = Post.find(params[:post_id])
     authorize @summary
     if @summary.save
       redirect_to [@post, @summary], notice: "Summary was saved successfully."
     else
       flash[:error] = "Error creating summary. Please try again."
       render :new
     end
   end
  
end
