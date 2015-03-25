class PostPolicy < ApplicationPolicy
  
  def index?
    true
  end

  class Scope < Scope
    #attr_reader :user, :scope

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(:published => true)
      end
    end
    
  end
  
end