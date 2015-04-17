class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  
  self.per_page = 50
  
  default_scope { order('created_at DESC') }
end
