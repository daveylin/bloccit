class FavoritesController < ApplicationController
  
   def create
     @topic = Topic.find(params[:topic_id])
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)
 
     if favorite.save
       # Add code to generate a success flash and redirect to post
       # Remember the path shortcut: [post.topic, post]
       flash[:notice] = "Post was favorited."
       redirect_to [@topic, post]
     else
       # Add code to generate a failure flash and redirect to post
       flash[:error] = "There was an error favoriting the post. Please try again."
       render :new
     end
   end

   def destroy
     # Get the post from the params
     # Find the current user's favorite with the ID in the params
     @topic = Topic.find(params[:topic_id])
     post = Post.find(params[:post_id])
     favorite = current_user.favorited(post)
     
   if favorite.destroy
     # Flash success and redirect to @post
     flash[:notice] = "Post was unfavorited."
     redirect_to [@topic, post]
   else
     flash[:error] = "There was an error unfavoriting the post. Please try again."
     render :show
   end
 end
  
end
