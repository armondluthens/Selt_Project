class SessionsController < ApplicationController
  
  @search = true; 
    
  def session_params
    params.require(:session).permit(:email, :password, :session_token)
  end
    
  def new
    # default: render 'new' template
  end
  
  def index
    
    # displays deals by current day
    @deals = Deal.all
    
    # Searching criteria
    if (params[:clear_search])
      render :action => 'index'
    else
      @deals = Deal.search(params[:restaurant]) unless params[:restaurant].blank?
      @deals = Deal.search(params[:deals]) 
      @deals = @deals.title unless params[:title].blank?
    end
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

