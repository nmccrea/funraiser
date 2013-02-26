class FundraisersController < ApplicationController
  
  before_filter :load_user_and_authorization, only: [:new, :create, :show]
  
  def index_all
  end
  
  def new
    # if the current user would not own this fundraiser, redirect to the owner user's dashboard
    unless @current_user_is_owner
      flash[:alert] = 'Sorry, you cannot create a fundraiser for somebody else.'
      redirect_to user_path( @owner_user )
    end
  end
  
  def create
    if @current_user_is_owner
      
      # create the fundraiser and go to its page
      fundraiser = Fundraiser.new( params[:fundraiser] )
      @owner_user.fundraisers << fundraiser
      if @owner_user.save! && fundraiser.save!
        redirect_to user_fundraiser_path( @owner_user, fundraiser )
      else
        redirect_to :new
      end
      
    else
      
      # redirect to the owner user's dashboard
      flash[:alert] = 'Sorry, you cannot create a fundraiser for somebody else.'
      redirect_to user_path( @owner_user )
      
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
