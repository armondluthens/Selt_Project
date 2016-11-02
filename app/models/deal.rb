class Deal < ActiveRecord::Base
  belongs_to :restaurant
  serialize :deal_days, WeekSauce
  
end
