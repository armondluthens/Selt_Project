class SessionsController < ApplicationController
    
  def session_params
    params.require(:session).permit(:email, :password, :session_token)
  end
    
  def new
    # default: render 'new' template
  end

  def create
    restaurant = Restaurant.find_by_email(session_params[:email])
    if restaurant && restaurant.authenticate(session_params[:password])
      session[:session_token] = restaurant.session_token
      @current_restaurant = restaurant
      flash[:notice] = "You are logged in as #{restaurant.name}."
        redirect_to root_path
    else
        flash[:notice] = "Invalid credentials. Re-enter, or click Sign-up for an account"
        redirect_to login_path
    end
  end


  def destroy
    reset_session
    redirect_to root_path
  end
    
end

