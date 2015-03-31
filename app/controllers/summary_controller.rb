class SummaryController < ApplicationController
  #def index
   #@summaries = Summary.all
    #authorize @summaries
  #end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
    authorize @summary
  end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def edit
  end
  
    def create
     @summary = Topic.new(params.require(:topic).permit(:description))
     authorize @summary
     if @summary.save
       redirect_to @summary, notice: "Topic was saved successfully."
     else
       flash[:error] = "Error creating summary. Please try again."
       render :new
     end
   end
  
end
