class FundraisersController < ApplicationController
  def new
  end
  
  def create
    @user = User.find( params[:user_id] )
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
end
