module SessionsHelper
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def user_admin?
    current_user.admin?
  end
end
