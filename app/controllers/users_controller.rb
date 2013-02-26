class UsersController < ApplicationController
  
  def show
    load_user_and_authorization
    @fundraisers = @owner_user.fundraisers
    render 'dashboard'
  end
  
  # ===
  # = Private Methods
  # ===
  private
  
  # loads the user object using the request params, and determines if this is the current user
  def load_user_and_authorization
    @owner_user = User.find( params[:id] )
    @current_user_is_owner = ( current_user_id == params[:id].to_i )
  end
end
