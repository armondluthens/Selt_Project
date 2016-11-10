class RestaurantsController < ApplicationController

  def restaurant_params
    params.require(:restaurant).permit(:name, :email, :password, :contact, :location, :description, :session_token)
  end
  
  def create
      @restaurant = Restaurant.new(restaurant_params)
      
      if Restaurant.exists?(email: @restaurant.email)
        flash[:notice] = "Account #{@restaurant.email} already exists. Please try again."
        redirect_to new_restaurant_path
      else
        Restaurant::create_restaurant!(restaurant_params)
        flash[:notice] = "Welcome #{@restaurant.name}. Your account was successfully created."
        redirect_to login_path
      end
      
  end
  
  def show
    id = params[:id]
    @restaurant = Restaurant.find(id)
  end
  
  
  def update
=begin
  
    @restaurant = Restaurant.find params[:id]
    
    if (@restaurant.invitationID).to_s == (params[:restaurant][:invitationID])
      if Restaurant.exists?(:name => restaurant_params[:name]) && Restaurant.exists?(:email => restaurant_params[:email])
        @restaurant.update_attributes!(restaurant_params)
        flash[:notice] = "#{@restaurant.name} has been successfully registered."
        redirect_to login_path
      end
      
    elsif (!(@restaurant.invitationID).to_s == (params[:restaurant][:invitationID]))
      flash[:notice] = "Restaurant Name, Restaurant Email, and/or Invitation ID is incorrect. Please try again."
      redirect_to edit_restaurant_path
    
    #User has already made it past InvitationID check
    else
      @restaurant.update_attributes!(restaurant_params)
      flash[:notice] = "Updates have been made"
      redirect_to edit_restaurant_path
    end
  end
  
  def edit
    @restaurant = Restaurant.find params[:id]
=end    
    # InvitationID is correct
    
#      # If Restaurant Name and Email is correct, save password
#      if Restaurant.exists?(:name => restaurant_params[:name]) && Restaurant.exists?(:email => restaurant_params[:email])
#        @restaurant.update_attributes!(restaurant_params)
#        flash[:notice] = "#{@restaurant.name} has been successfully registered." #Password saved
#        redirect_to login_path
#      end
        
    # InvitationID is incorrect
#    elsif !Restaurant.exists?(:invitationID => restaurant_params[:invitationID])
#      flash[:notice] = "Incorrect Invitation ID"
#      redirect_to edit_restaurant_path
      
    # No InvitationID required; must have already signed up correctly
#    else
#      @restaurant.update_attributes!(restaurant_params)
#      flash[:notice] = "#{@restaurant.name} has been successfully updated."
#      redirect_to edit_restaurant_path
#    end
    
  end
  
  def index
    @restaurants = Restaurant.all
  end
  
  
  
end
  