class SessionsController < ApplicationController
  
  def sign_in
    if user_is_logged_in
      flash[:notice] = 'You are already logged in.'
      redirect_to user_path( current_user )
    end
  end
  
  def submit_sign_in
    user = User.where( params[:user] ).first
    
    if user
      login( user )
      redirect_to user_path( user )
    else
      flash[:alert] = 'Invalid username or password.'
      redirect_to sign_in_path
    end
  end
  
  def sign_out
    logout
    redirect_to root_path
  end
  
  # ===
  # = Private Methods
  # ===
  private
end
