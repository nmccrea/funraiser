class UsersController < ApplicationController
  
  def show
    @user = User.find( params[:id] )
    @fundraisers = @user.fundraisers
    render 'dashboard'
  end
end
