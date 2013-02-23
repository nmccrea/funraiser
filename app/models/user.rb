class User < ActiveRecord::Base
  
  # has_many   :owned_proposals, :inverse_of => :owner_organization, :class_name => "Proposal"
  has_many :fundraisers, :foreign_key => :owner_user_id
end
