class CommentPolicy < ApplicationPolicy
   def index?
     false
   end
  
   def create?
     user.present?
   end
 
  def new?
     create?
   end
end