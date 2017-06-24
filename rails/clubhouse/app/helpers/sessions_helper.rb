module SessionsHelper
  attr_writer :current_user

  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
    flash[:info] = "You have been logged out"
  end

  def logged_in?
    !current_user.nil?
  end

end
