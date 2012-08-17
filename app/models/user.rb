class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :password, :password_confirmation, :user_name, :location, :phone_number, :role
  
  has_secure_password
  
  has_many :tools
end


