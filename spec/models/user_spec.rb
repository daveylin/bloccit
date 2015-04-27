require 'rails_helper'
 
 describe User do
 
   include TestFactories

   before do
       @post = associated_post
       @user = authenticated_user
    end
   
   describe "#favorited(post)" do
     it "returns `nil` if the user has not favorited the post" do
       expect ( @user.favorited(@post)) == nil
     end
 
     it "returns the appropriate favorite if it exists" do
      @favorite = @user.favorites.build(post: @post)
      @favorite.save
      expect( @user.favorited( @post )) == @favorite
     end
     
     it "returns `nil` if the user has favorited another post" do
      @post2 = associated_post
      @favorite = @user.favorites.build(post: @post2)
      @favorite.save
      expect( @user.favorited( @post )) == nil
     end
   end
 end