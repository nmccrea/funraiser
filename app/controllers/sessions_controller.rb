class SessionsController < Devise::SessionsController
  def new
  end
  
  def create
    sign_in( resource )
  end
  
  def destroy
    sign_out( current_user )
    redirect_to root_path
  end
end
