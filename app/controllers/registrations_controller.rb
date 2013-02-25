class RegistrationsController < ApplicationController
  
  def sign_up
  end
  
  def create
    user = User.new( params[:user] )
    if user.save!
      login( user )
      redirect_to user_path( user )
    else
      raise Exception.new( 'invalid registration' )
    end
  end
  
  # ===
  # = Private Methods
  # ===
  private
end
