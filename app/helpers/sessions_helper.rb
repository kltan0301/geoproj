module SessionsHelper
  #tags the user id of the logged in user to the session
  def log_in(user)
    session[:user_id] = user.id
  end
  #gets the current user or sets it to logged in user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]);
  end

  def current_user?(user)
    user == current_user
  end

  #checks if there is a user logged in
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

end
