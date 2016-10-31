class RestaurantsController < ApplicationController
<<<<<<< HEAD
  #
  def movie_params
=======

  def restaurant_params
>>>>>>> armond
    params.require(:restaurant).permit(:name, :location, :description)
  end
  
  def create
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
  
end
  