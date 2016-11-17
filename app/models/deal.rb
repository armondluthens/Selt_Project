class Deal < ActiveRecord::Base
  belongs_to :restaurant
  #serialize :deal_days, WeekSauce
  
  
  validates :title, presence: true
  
  
  def self.create_deal!(params)
        #params[:session_token] = SecureRandom.base64 #don't think a deal needs a session token
        Deal.create!(params)
  end
  
end
