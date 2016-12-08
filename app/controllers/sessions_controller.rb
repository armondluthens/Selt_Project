class SessionsController < ApplicationController
    
  def session_params
    params.require(:session).permit(:email, :password, :session_token)
  end
    
  def new
    # default: render 'new' template
  end
  
  def index
    @allDeals = Deal.all
    @deals = []
    i = 0
    
    @allDeals.each do |deal|
      if deal.sunday == true && Time.now.in_time_zone("Central Time (US & Canada)").sunday?
        @deals[i] = deal
        i += 1
      elsif deal.monday == true && Time.now.in_time_zone("Central Time (US & Canada)").monday?
        @deals[i] = deal
        i += 1
      elsif deal.tuesday == true && Time.now.in_time_zone("Central Time (US & Canada)").tuesday?
        @deals[i] = deal
        i += 1
      elsif deal.wednesday == true && Time.now.in_time_zone("Central Time (US & Canada)").wednesday?
        @deals[i] = deal
        i += 1
      elsif deal.thursday == true && Time.now.in_time_zone("Central Time (US & Canada)").thursday?
        @deals[i] = deal
        i += 1
      elsif deal.friday == true && Time.now.in_time_zone("Central Time (US & Canada)").friday?
        @deals[i] = deal
        i += 1
      elsif deal.saturday == true && Time.now.in_time_zone("Central Time (US & Canada)").saturday?
        @deals[i] = deal
        i += 1
      end
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

