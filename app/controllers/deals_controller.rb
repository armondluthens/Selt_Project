class DealsController < ApplicationController
  
  #uncomment line below to make sure restaurant is logged in 
  #before_filter :set_current_restaurant
  
  def deal_params
    params.require(:deal).permit(:title, :start_date, :end_date, :description, :start_time, :end_time, :sunday, :monday, :tuesday, :wednesdaay, :thursday, :friday, :saturday)
    #params.require(:deal).permit(:title, :description)
  end
  
  def create
    # Do we want to check if a deal has already been created? If so need to do that here
    
    @deal = Deal.create!(deal_params)
    flash[:notice] = "#{@deal.title} was successfully created"
    redirect_to root_path
    
  end

  def show
    id = params[:id]
    @deal = Deal.find(id)
  end

  def update
    @deal = Deal.find params[:id]
    @deal.update_attributes!(deal_params)
    flash[:notice] = "#{@deal.title} was successfully updated."
    redirect_to root_path
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    flash[:notice] = "#{@deal.title} was successfully deleted."
    redirect_to root_path
  end

  def new
  end
end
