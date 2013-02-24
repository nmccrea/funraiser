class UsersController < ApplicationController
  
  def new
  end
  
  def create
    user = User.new( params[:user] )
    if user.save!
      redirect_to user_path( user )
    else
      redirect_to :new
    end
  end
  
  def show
    @user = User.find( params[:id] )
    render 'dashboard'
  end
end
