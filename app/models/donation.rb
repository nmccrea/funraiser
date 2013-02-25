class Donation < ActiveRecord::Base
  
  # Associations
  belongs_to :fundraiser
  
  # Accessibility
  attr_accessible :amount, :donor_first_name, :donor_last_name, :donor_message
end
