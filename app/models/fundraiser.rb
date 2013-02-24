class Fundraiser < ActiveRecord::Base
  
  belongs_to :owner_user, :class_name => "User"
  has_many :donations, :foreign_key => :recipient_fundraiser_id
end