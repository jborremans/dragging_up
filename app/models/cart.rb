class Cart < ActiveRecord::Base
  attr_accessible :user_id, :cartool

  
  belongs_to :user
  has_many   :cartools
  has_one    :order
  
  def total_price
      cartools = Cartool.find_all_by_cart_id(self.id)
      tool_prices = cartools.collect { |koala| koala.tool.tool_price }
      tool_total = tool_prices.sum
      total_price = tool_total * 1.1
    end  
end
