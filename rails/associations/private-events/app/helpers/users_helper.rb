module UsersHelper

  def current_user?
    !session[:user_name].nil?
  end

  def current_user
    session[:user_name]
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
