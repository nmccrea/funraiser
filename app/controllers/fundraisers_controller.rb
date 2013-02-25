class FundraisersController < ApplicationController
  
  before_filter :load_user
  
  def new
  end
  
  def create
    fundraiser = Fundraiser.new( params[:fundraiser] )
    
    @user.fundraisers << fundraiser
    if @user.save! && fundraiser.save!
      redirect_to user_fundraiser_path( @user, fundraiser )
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
  def load_user
    @user = User.find( params[:user_id] )
  end
  
end
