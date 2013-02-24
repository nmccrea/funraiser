class User < ActiveRecord::Base
  
  has_many :fundraisers, :foreign_key => :owner_user_id
  
  attr_accessible :username, :first_name, :last_name
end
