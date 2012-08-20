class Cartool < ActiveRecord::Base
  attr_accessible :cart_id, :tool_id, :user_id
  
  has_many   :tools
  belongs_to :user
  belongs_to :cart
end