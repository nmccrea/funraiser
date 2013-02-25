class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def login( p_user )
    session[:current_user_id] = p_user.id
  end
  
  def logout
    session.delete( :current_user_id )
  end
  
  def current_user
    if session[:current_user_id]
      User.find( session[:current_user_id] )
    else
      nil
    end
  end
  
  def authorize_current_page
  end
end
