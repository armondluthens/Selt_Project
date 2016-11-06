class RestaurantsController < ApplicationController

  def restaurant_params
    params.require(:restaurant).permit(:name, :email, :password, :contact, :location, :description, :invitationID, :session_token)
  end
  
  def create
    if Restaurant.exists?(:name => restaurant_params[:name])
      flash[:notice] = "Restaurant name is unavailable. Try again."
      redirect_to new_restaurant_path
      
    elsif Restaurant.exists?(:email => restaurant_params[:email])
      flash[:notice] = "Email is already registered with an account. Please log in or inquiry forgotten password."
      redirect_to login_path
      
    else
      begin 
        pw = (password_generator(16))
        puts pw 
        Restaurant.create!(restaurant_params.merge(:password => pw))
        flash[:notice] = "Welcome #{restaurant_params[:name]}. Please wait for a follow-up email."
      rescue ActiveRecord::RecordInvalid => e
        messages = e.record.errors.full_messages
        notice = "Error: "
        messages.each do |m|
          notice += m + ". "
        end 
        flash[:notice] = notice
        redirect_to new_restaurant_path and return 
      end
      ### NEED TO USE EMAIL API HERE!! ###
      
      redirect_to login_path
    end
   
  end
  
  def show
    id = params[:id]
    @restaurant = Restaurant.find(id)
  end
  
  def update
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
  
  def password_generator(length)
	  valid_characters = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "!", "@", "#", "$", "%", "^", "&"]
	  pw = ""
	  length.times do
  		pw += valid_characters.sample
	  end
  	return pw
  end
  
end
  