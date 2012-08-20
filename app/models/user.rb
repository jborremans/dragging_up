class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :password, :password_confirmation
  
  has_secure_password

  # has_one :cartitem, => through => :cart
  has_one  :cart
  has_many :tools
  
end


