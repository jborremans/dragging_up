class User < ActiveRecord::Base
  attr_accessible :email, :name, :pasword_digest
end
