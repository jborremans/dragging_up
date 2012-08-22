class Cart < ActiveRecord::Base
  attr_accessible :user_id, :cartool
  
  belongs_to :user
  has_many   :cartools
  
end
