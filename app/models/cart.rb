class Cart < ActiveRecord::Base
  attr_accessible :user_id, :cartool
  
  belongs_to :user
  has_many   :cartools
  has_one    :order
  
def total_price(cart_id)
      cartools = Cartool.find_all_by_cart_id(cart_id)
      tool_prices = cart_items.collect { |cart_item| cart_item.tool.price }
      tool_total = tool_prices.sum
      total_price = tool_total * 1.1
    end  
end
