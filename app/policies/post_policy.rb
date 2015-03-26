class PostPolicy < ApplicationPolicy
  
  def index?
    true
  end

  class Scope < Scope
    #attr_reader :user, :scope

    def resolve
      if user.nil?
        scope.none
      elsif user.admin?
        scope.all
      else
        scope.where(:user_id => user.id)
      end
    end
    
  end
  
end