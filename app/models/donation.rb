class Donation < ActiveRecord::Base
  
  # Associations
  belongs_to :fundraiser
  
  # Accessibility
  attr_accessible :amount
end
