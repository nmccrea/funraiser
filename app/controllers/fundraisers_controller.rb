class FundraisersController < ApplicationController
  def new
  end
  
  def create
    fundraiser = Fundraiser.new( params[:fundraiser] )
    if fundraiser.save!
      redirect_to fundraiser_path( fundraiser )
    else
      redirect_to :new
    end
  end
  
  def show
    @fundraiser = Fundraiser.find( params[:id] )
  end
end
