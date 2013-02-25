class Fundraiser < ActiveRecord::Base
  
  # Associations
  belongs_to :owner_user, :class_name => "User"
  has_many :donations, :foreign_key => :recipient_fundraiser_id
  
  # Initialize the object
  after_initialize :init
  
  # Accessiblity
  attr_accessible :fundraiser_name, :fundraising_goal
  
  # ====
  # Private Methods
  # ====
  private
  
  def init
    # Set default values
    self.funds_raised = 0;
  end
end
