class Order < ActiveRecord::Base
  attr_accessible :card_expiration_date, :card_number, :card_type, :card_verification, :first_name, :last_name
end
