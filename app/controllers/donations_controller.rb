class DonationsController < ApplicationController
  
  before_filter :load_user_and_fundraiser
  
  def create
    donation = Donation.new( params[:donation] )
    @fundraiser.receive_donation( donation )
    
    if @fundraiser.save! && donation.save!
      redirect_to user_fundraiser_path( @user, @fundraiser )
    else
      raise Exception.new( "could not save fundraiser and donation" )
    end
  end
  
  # ===
  # = Private Methods
  # ===
  private
  
  # loads the user and fundraiser object using the request params
  def load_user_and_fundraiser
    @user = User.find( params[:user_id] )
    @fundraiser = Fundraiser.find( params[:fundraiser_id] )
  end
  
end
