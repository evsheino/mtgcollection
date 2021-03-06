module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id if not user.nil?
    self.current_user = user
  end

  def signed_in?
    !self.current_user.nil?
  end

  def sign_out
    session[:user_id] = nil
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
