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
=begin
    @allDeals = Deal.all
    @deals = []
    @time = Time.now.in_time_zone("Central Time (US & Canada)").wday #returns today's weekday

    #storing deals for each day of the week
    sun_deals = []; mon_deals = []; tues_deals = []; wed_deals = []; thurs_deals = []; fri_deals = []; sat_deals = [];
    sun = 0; mon = 0; tues = 0; wed = 0; thurs = 0; fri = 0; sat = 0;
    
    @allDeals.each do |deal|
      #destroy expired deals

      if deal.end_date < Time.now.in_time_zone("Central Time (US & Canada)")
        deal.destroy
      end
      if deal.sunday == true
        sun_deals[sun] = deal
        sun += 1
      end
      #if deal.monday == true
        #mon_deals[mon] = deal
        #mon += 1
      #end
      if deal.tuesday == true
        tues_deals[tues] = deal
        tues += 1
      end
      if deal.wednesday == true
        wed_deals[wed] = deal
        wed += 1
      end
      if deal.thursday == true
        thurs_deals[thurs] = deal
        thurs += 1
      end
      if deal.friday == true
        fri_deals[fri] = deal
        fri += 1
      end
      if deal.saturday == true
        sat_deals[sat] = deal
        sat += 1
      end

    end
       
    if @time == 0
      @deals += sun_deals + mon_deals + tues_deals + wed_deals + thurs_deals + fri_deals + sat_deals
      @deals = @deals.uniq
    elsif @time == 1
      @deals += mon_deals + tues_deals + wed_deals + thurs_deals + fri_deals + sat_deals + sun_deals
      @deals = @deals.uniq
    elsif @time == 2
      @deals += tues_deals + wed_deals + thurs_deals + fri_deals + sat_deals + sun_deals + mon_deals
      @deals = @deals.uniq
    elsif @time == 3
      @deals += wed_deals + thurs_deals + fri_deals + sat_deals + sun_deals + mon_deals + tues_deals
      @deals = @deals.uniq
    elsif @time == 4
      @deals += thurs_deals + fri_deals + sat_deals + sun_deals + mon_deals + tues_deals + wed_deals
      @deals = @deals.uniq
    elsif @time == 5
      @deals += fri_deals + sat_deals + sun_deals + mon_deals + tues_deals + wed_deals + thurs_deals
      @deals = @deals.uniq
    elsif @time == 6
      @deals += sat_deals + sun_deals + mon_deals + tues_deals + wed_deals + thurs_deals + fri_deals
      @deals = @deals.uniq
    end
    
=end
    @deals = Deal.all
    
    if (params[:clear_search])
      render :action => 'index'
    else
      @deals = Deal.search(params[:restaurant]) unless params[:restaurant].blank?
      @deals = Deal.search(params[:search])
      @deals = @deals.title unless params[:title].blank?
    end
  end
  
  def update
    @deal = Deal.find(params[:id])
    @deal.monday = false;
    @deal.tuesday = false;
    @deal.wednesday = false;
    @deal.thursday = false;
    @deal.friday = false;
    @deal.saturday = false;
    @deal.sunday = false;
    @deal.update_attributes!(deal_params)
    flash[:notice] = "#{@deal.title} has been successfully updated"
    redirect_to deal_path(@deal)
  end
  
  def edit
    @deal = Deal.find params[:id]
  end
  
end
