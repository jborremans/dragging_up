class Tool < ActiveRecord::Base
  attr_accessible :tool_condition, :tool_description, :tool_name, :tool_picture, :tool_price, :tool_type, :user_id
  

  belongs_to :user
  has_many :cartools
  
end
