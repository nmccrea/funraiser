class Fundraiser < ActiveRecord::Base
  
  # Associations
  belongs_to :owner_user, :class_name => "User"
  has_many :donations, :foreign_key => :recipient_fundraiser_id
  
  # Initialize the object
  after_initialize :init
  
  # Accessiblity
  attr_accessible :fundraiser_name, :fundraising_goal
  
  # ===
  # = Public Methods
  # ===
  
  # returns the percentage, not the fraction
  def percent_of_goal_raised
    ( ( 100.0 * self.funds_raised ) / self.fundraising_goal ).round
  end
  
  def receive_donation( p_donation )
    if p_donation.amount >= 0
      self.donations << p_donation
      self.funds_raised += p_donation.amount
    end
  end
  
  # ====
  # = Private Methods
  # ====
  private
  
  def init
    # Set default values
    self.funds_raised = 0;
  end
end
