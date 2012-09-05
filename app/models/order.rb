class Order < ActiveRecord::Base
  attr_accessible :card_expires_on, :card_number, :card_type, :card_verification, :first_name, :last_name, :cart_id, :ip_address, :express_token
  
  belongs_to :cart
  belongs_to :user
  has_many   :cartools
  has_many   :transactions, :class_name => "OrderTransaction"
  has_one    :order_transaction
  
  attr_accessor :card_number, :card_verification 
  
  before_validation :validate_card, :on => :create

    def purchase
      response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
      transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
      cart.update_attribute(:purchased_at, Time.now) if response.success?
      response.success?
    end
    
    def express_token=(token)
        write_attribute(:express_token, token)
        if new_record? && !token.blank?
          details = EXPRESS_GATEWAY.details_for(token)
          self.express_payer_id = details.payer_id
          self.first_name = details.params["first_name"]
          self.last_name = details.params["last_name"]
        end
      end

    def price_in_cents
      (cart.total_price*100).round
    end

    private

      def purchase_options
        {
          :ip => ip_address,
          :billing_address => {
            :name     => "Ryan Bates",
            :address1 => "123 Main St.",
            :city     => "New York",
            :state    => "NY",
            :country  => "US",
            :zip      => "10001"
          }
        }
      end

      def credit_card
        @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
          :type               => card_type,
          :number             => card_number,
          :verification_value => card_verification,
          :month              => card_expires_on.month,
          :year               => card_expires_on.year,
          :first_name         => first_name,
          :last_name          => last_name
        )
      end

      def validate_card
        unless credit_card.valid?
          credit_card.errors.full_messages.each do |message|
            errors[:base] << message
          end
        end
      end
  end