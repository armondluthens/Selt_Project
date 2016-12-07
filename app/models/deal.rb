class Deal < ActiveRecord::Base
  belongs_to :restaurant
  #serialize :deal_days, WeekSauce

  validates :title, presence: true
  
  validates_presence_of :start_date, :end_date

  validate :end_date_is_after_start_date

  def self.create_deal!(params)
    #params[:session_token] = SecureRandom.base64 #don't think a deal needs a session token
    Deal.create!(params)
  end
  
  # performs simple search based on deal title
  def self.search(term)
    where("title like :term", term: "%#{term}%")
  end
  
  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?
  
    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date") 
    end 
  end
  
end
