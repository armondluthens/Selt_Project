class Search < ActiveRecord::Base
    
  def self.search_deals!(params)
      
    deals = Deal.all
    
    deals = deals.where(["title LIKE ?", "%#{params[:title]}%"]) if params[:title].present?
    deals = deals.where(["ethnicity LIKE ?", params[:ethnicity]]) if params[:ethnicity].present?
    deals = deals.where(["restaurant_name LIKE ?", "%#{params[:restaurant_name]}%"]) if params[:restaurant_name].present?
    
    Deal.create!(params)
  end
  
  
end
