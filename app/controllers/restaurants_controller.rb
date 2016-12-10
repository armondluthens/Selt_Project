class RestaurantsController < ApplicationController

  def restaurant_params
    params.require(:restaurant).permit(:name, :email, :password, :password_confirmation, :contact, :location, :description, :session_token)
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
    @deals = Deal.all
    
  end
  
  
  def update
    @restaurant = Restaurant.find params[:id]
  
    if @restaurant.update_attributes(restaurant_params)
      flash[:notice] = "Updates have been made"
      redirect_to edit_restaurant_path
    else 
      render 'edit'
    end
    
  end
  
  def edit
    @restaurant = Restaurant.find params[:id]

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
    
    if (params[:clear_search])
      render :action => 'index'
    else
      @restaurants = Restaurant.search(params[:restaurant]) unless params[:restaurant].blank?
      @restaurants = @restaurants.title unless params[:title].blank?
    end
  end
  
  
  
end
  