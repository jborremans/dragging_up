class Order < ActiveRecord::Base
  attr_accessible :card_expiration_date, :card_number, :card_type, :card_verification, :first_name, :last_name, :cart_id, :tool_id, :ip_address
  
  belongs_to :cart
  belongs_to :user
  has_many   :cartools
  
end
