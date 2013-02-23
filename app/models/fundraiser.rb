class Fundraiser < ActiveRecord::Base
  
  # belongs_to :owner_organization, :class_name => "Organization", :foreign_key => :owner_org_id, :inverse_of => :owned_proposals
  belongs_to :owner_user, :class_name => "User"
end
