class Search < ActiveRecord::Base
    
  def search_deals
      
    deals = Deal.all
    
    deals = deals.where(["title LIKE ?", "%#{title}%"]) if title.present?
    deals = deals.where(["ethnicity LIKE ?", ethnicity]) if ethnicity.present?
    deals = deals.where(["restaurant_name LIKE ?", "%#{restaurant_name}%"]) if restaurant_name.present?
    
    return deals
  end
  
  
end
