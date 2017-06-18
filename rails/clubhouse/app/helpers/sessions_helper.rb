module SessionsHelper

  def log_in(user)
    # user.remember_token = self.create_token
    user.remember_user
    cookies.permanent[:remember_token] = user.remember_token
    # debugger
    self.current_user = user
  end

  def current_user
    @current_user ||= User.find_by(remember_digest: User.digest(cookies[:remember_token]))
  end

  # def current_user=(user)
  #   @current_user = user
  # end
  #
  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
    flash[:info] = "You have been logged out"
  end

  def logged_in?
    !current_user.nil?
  end

end
