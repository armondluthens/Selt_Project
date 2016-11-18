class DealsController < ApplicationController

  def deal_params
    params.require(:deal).permit(:title, :start_date, :end_date, :description, :start_time, :end_time, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :ethnicity)
  end
  
  def create
    # Do we want to check if a deal has already been created? If so need to do that here
    #deal_params[:restaurant_name] = @current_restaurant.name
    
    @deal = Deal.create_deal!(deal_params)
    
    # Update database 'deals' column to contain current_restaurant's name
    @deal.restaurant_name = @current_restaurant.name
    @deal.restaurant_id = @current_restaurant.id
    @deal.save
    
    flash[:notice] = "#{deal_params[:title]} was successfully created"
    redirect_to deal_path(@deal)
    
  end

  def show
    id = params[:id]
    @deal = Deal.find(id)
    #flash[:notice] = @deal.id
    
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    flash[:notice] = "#{@deal.title} was successfully deleted."
    redirect_to deals_path
  end

  def index
    @deals = Deal.all
    
  end
  
  def update
    @deal = Deal.find(params[:id])
    @deal.update_attributes!(deal_params)
    flash[:notice] = "#{@deal.title} has been successfully updated"
    redirect_to deal_path(@deal)
  end
  
  def edit
    @deal = Deal.find params[:id]
  end
  
end
