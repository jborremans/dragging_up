class Cart < ActiveRecord::Base
  attr_accessible :user_id
  
  has_many   :tools
  belongs_to :user
  
end
