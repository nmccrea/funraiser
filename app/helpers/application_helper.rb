module ApplicationHelper
  
  @user_is_logged_in = nil
  
  def body_tag_class
    "#{controller_name}-#{action_name}"
  end
  
  def user_is_logged_in?
    @user_is_logged_in ||= controller.user_is_logged_in?
    @user_is_logged_in
  end
end
