class User < ActiveRecord::Base
  
  has_many :fundraisers, :foreign_key => :owner_user_id
end
