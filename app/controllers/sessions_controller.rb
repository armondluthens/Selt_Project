class SessionsController < ApplicationController
    
  def session_params
    params.require(:session).permit(:email, :password, :session_token)
  end
    
  def new
    # default: render 'new' template
  end
  
  def create
    #puts session_params
    #@restaurant = Restaurant.find_by(name: session_params[:name], password: session_params[:password])
    if (Restaurant.exists? email: session_params['email'])
      restaurant = Restaurant.find_by_email(session_params['email'])
      if(restaurant.email == session_params['email'])
        session[:session_token] = restaurant.session_token
        flash[:notice] = "You are logged in as #{restaurant.name}."
        redirect_to root_path
      else
        flash[:notice] = "Invalid credentials. Re-enter, or click Sign-up for an account"
        redirect_to login_path
      end
    end
    
  end

  def destroy
    reset_session
    redirect_to root_path
  end
    
end