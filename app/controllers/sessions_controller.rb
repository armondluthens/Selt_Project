class SessionsController < ApplicationController
    
  def session_params
    params.require(:restaurant_session).permit(:password, :name)
  end
    
  def new
    # default: render 'new' template
  end
  
  def create
    puts session_params
    @restaurant = Restaurant.find_by(name: session_params[:name], password: session_params[:password])
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