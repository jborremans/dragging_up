class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :password, :password_confirmation
  
  has_secure_password

  has_one  :cart
  has_many :tools
  has_many :cartool, through: :cart
  
  validates :name, presence: true
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, 
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
  
  
  after_create :create_cart
  
  def create_cart
    @cart = Cart.new
    @cart.user_id = self.id
    @cart.save
  end
    
end


