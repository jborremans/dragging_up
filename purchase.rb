require "rubygems"
require "active_merchant"

ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::PaypalGateway.new(
  :login => "joseph_1345770257_biz@gmail.com",
  :password => "1345770280",
  :signature => "ALUB7KdN9BLjb-GBwpM3eA0azbV5AUWDZWlqw--Eurd87pfWNx9-XoXl"
)

credit_card = ActiveMerchant::Billing::CreditCard.new(
  :brand              => "visa",
  :number             => "4230384705216457",
  :verification_value => "123",
  :month              => 8,
  :year               => 2017,
  :first_name         => "Foo",
  :last_name          => "Bar"
)

if credit_card.valid?
  response = gateway.authorize(1000, credit_card, :ip => "127.0.0.1")
  if response.success?
    gateway.capture(1000, response.authorization)
    puts "Purchase complete!"
  else
    puts "Error: #{response.message}"
  end
else
  puts "Error: credit card is not valid. #{credit_card.errors.full_messages.join('. ')}"
end