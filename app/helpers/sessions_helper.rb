module SessionsHelper
  def login!(user)
    session[:session_token] = user.session_token
    current_user = user
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
