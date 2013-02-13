module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    #call current_user=(user)
    self.current_user = user
  end
  
  #equal operator
  def current_user=(user)
    @current_user = user
  end
  
  
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  
  #check if signed in
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
