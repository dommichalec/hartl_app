module SessionsHelper
  # Logs in a user with a temp cookie in the session hash
  def login(user)
    session[:user_id] = user.id
  end

  # Logs out a user by removing temp cookie in session hash
  def logout
    # session.delete(:user_id) does the same thing
    session[:user_id] = nil
  end

  # unlike self.find, self.find_by doesn't raise an exception if the user_id
  # doesn’t exist, simply returns nil
  # storing the result of User.find_by in an instance variable,
  # which hits the database the first time but returns the instance variable
  # immediately on subsequent invocations

  # returns the current user (if any) via session id
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
