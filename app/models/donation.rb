class Donation < ActiveRecord::Base
  
  # Associations
  belongs_to :fundraiser
end
