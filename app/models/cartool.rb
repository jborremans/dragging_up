class Cartool < ActiveRecord::Base
  attr_accessible :cart_id, :tool_id, :user_id
  
  has_many   :tools
  belongs_to :user
  belongs_to :cart
  belongs_to :order
  
  
  def full_price
    number_to_currency(Tool.find_by_id(self.tool_id) * quantity)
  end 
end
