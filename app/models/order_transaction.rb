class OrderTransaction < ActiveRecord::Base
  attr_accessible :action, :amount, :authorization, :message, :order_id, :params, :success
  
  belongs_to :order
  
  def response=(response)
    self.success       =response.success?
    self.authorization =response.authorization
    self.message       =response.message
    self.params        =response.params
  rescue ActiveMerchant::ActiveMerchantError => e
    self.sucess        =false
    self.authorization =nil
    self.message       ={}   
  end
end 
