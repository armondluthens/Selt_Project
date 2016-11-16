class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_current_restaurant
  
  def set_current_restaurant
    @current_restaurant ||= session[:session_token] && Restaurant.find_by_session_token(session[:session_token])
    #redirect_to login_path unless @current_restaurant
    
  end
  
end


