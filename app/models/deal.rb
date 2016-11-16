class Deal < ActiveRecord::Base
  belongs_to :restaurant
  #serialize :deal_days, WeekSauce
  
  
  validates :title, presence: true
  
  
  def Deal::create_deal!(deal_params)
        deal_params[:session_token] = SecureRandom.base64
        Deal.create!(deal_params)
  end
  
end
