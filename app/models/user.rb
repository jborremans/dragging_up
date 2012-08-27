class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :password, :password_confirmation
  
  has_secure_password

  has_one  :cart
  has_many :tools
  has_many :cartool
  
  after_create :create_cart
  
  def create_cart
    @cart = Cart.new
    @cart.user_id = self.id
    @cart.save
  end
    
end


