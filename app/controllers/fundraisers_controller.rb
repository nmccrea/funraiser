class FundraisersController < ApplicationController
  
  before_filter :load_user_and_authorization
  
  def new
  end
  
  def create
    fundraiser = Fundraiser.new( params[:fundraiser] )
    
    @owner_user.fundraisers << fundraiser
    if @owner_user.save! && fundraiser.save!
      redirect_to user_fundraiser_path( @owner_user, fundraiser )
    else
      redirect_to :new
    end
  end
  
  def show
    @fundraiser = Fundraiser.find( params[:id] )
  end
  
  # ===
  # = Private Methods
  # ===
  private
  
  # loads the user object using the request params
  def load_user_and_authorization
    @owner_user = User.find( params[:user_id] )
    @current_user_is_owner = ( current_user_id == params[:user_id].to_i )
  end
  
end
