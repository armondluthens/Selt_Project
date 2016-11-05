class SessionsController < ApplicationController
    
  def restaurant_params
    params.require(:restaurant).permit(:name, :email, :password, :contact, :location, :description, :invitationID, :session_token)
  end
    
  def new
    # default: render 'new' template
  end
  
  def create
    
    @restaurant = Restaurant.find_by(restaurant_params)
    
    if (!@restaurant.nil?)
      flash[:notice] = "You are logged in as #{@restaurant.name}."
      session[:session_token] = @restaurant.session_token
      redirect_to root_path
    else
      flash[:notice] = "Invalid credentials. Re-enter, or click Sign-up for an account"
      redirect_to login_path
    end
    
  end

  def destroy
    session[:session_token] = nil
    redirect_to root_path
  end
    
end