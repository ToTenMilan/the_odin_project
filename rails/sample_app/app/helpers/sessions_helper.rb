module SessionsHelper
  # methods defined in this helper are available in all controllers and views by including this module in ApplicationController

  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember # update the remember_digest in db
    cookies.permanent.signed[:user_id] = user.id # save encrypted id in cookies
    cookies.permanent[:remember_token] = user.remember_token # like above
  end

  # Returns the current logged-in user (if any)
  def current_user
    # first check if user has still opened browser(session)
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id) # find raises exception(if no record found) so find_by need to be used, which returns nil
    # if not check whether cookies are present
    elsif (user_id = cookies.signed[:user_id])
      # raise # to check if this path of code is covered
      user = User.find_by(id: user_id)
      # if user is trueish and remember_token matches (with that from db?)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Forgets a persistent session.
  def forget(user)
    user.forget # defined in user (model_name.class_method)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_user) # forget defined above
    session.delete(:user_id)
    @current_user = nil
  end
end
