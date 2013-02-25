class User < ActiveRecord::Base
  
  # Associations
  has_many :fundraisers, :foreign_key => :owner_user_id
  
  # Accessibility
  attr_accessible :username, :first_name, :last_name
end
