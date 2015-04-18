class VotesController < ApplicationController
  
before_action :load_post_and_vote
  
  def up_vote
    # http://apidock.com/rails/ActionController/Base/redirect_to
    update_vote!(1)
    redirect_to :back
  end
  
  def down_vote
    # http://apidock.com/rails/ActionController/Base/redirect_to
    update_vote!(-1)
    redirect_to :back
  end
  
  def load_post_and_vote
    # extract into this method the definition of @post and @vote
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first
  end

  def update_vote!(new_value)
    # Extract vote updating/creating logic here.
    # This method has access to @vote, because of the before_action
    if @vote
      @vote.update_attribute(:value, new_value)
    else
      @vote = current_user.votes.create(value: new_value, post: @post)
    end
  end
  
end