class SessionsController < ApplicationController
  
  def sign_in
  end
  
  def submit_sign_in
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
