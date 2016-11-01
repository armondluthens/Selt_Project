class RestaurantsController < ApplicationController

  def restaurant_params
    params.require(:restaurant).permit(:name, :password, :email, :contact, :location, :description)
  end
  
  def create
    #### not sure if needed..
    #### restaurants will be pre-made in the database
    @restaurant = Restaurant.new(restaurant_params)
    
    unique_id_check = true
    Restaurant.all.each do |i|
      if i.restaurant_id == @restaurant.restaurant_id
        unique_id_check = false
      end
    end
    
    if unique_id_check == false
      flash[:notice] = "Restaurant ID already exists."
      redirect_to new_restaurant_path and return
    else
      User::create_restaurant!(restaurant_params)
      flash[:notice] = "#{@restaurant.restaurant_id} was created successfully"
      redirect_to login_path
    end
   
  end
  
  def show
    id = params[:id]
    @restaurant = Restaurant.find(id)
  end
  
  def edit
    @restaurant = Restaurant.find params[:id]
  end
  
  def index
    @restaurants = Restaurant.all
  end
  
end
  