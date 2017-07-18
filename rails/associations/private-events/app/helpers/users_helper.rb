module UsersHelper

  def current_user?
    !session[:user_name].nil?
  end

  def current_user
    if (user_id = session[:id])
      @current_user ||= User.find(user_id)
    end
  end

  def clear_cookies
    cookies.delete(:name)
    cookies.delete(:id)
  end

  def clear_session
    session[:user_name] = nil
    session[:id] = nil
  end

end
