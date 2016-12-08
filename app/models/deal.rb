class Deal < ActiveRecord::Base
  belongs_to :restaurant
  #serialize :deal_days, WeekSauce
  
#scope :title, -> { where(category: 'title') }
# scope :restaurant_name, -> { where(category: 'restaurant_name') }
  
  
  validates :title, presence: true
  
  validates_presence_of :start_date, :end_date

  validate :end_date_is_after_start_date

  def self.create_deal!(params)
    #params[:session_token] = SecureRandom.base64 #don't think a deal needs a session token
    Deal.create!(params)
  end
  
  # performs simple search based on deal title
  def self.search(term)
    if (term == "sunday" || term == "Sunday")
      Deal.where(sunday: true)
    elsif(term == "monday" || "Monday")
      Deal.where(monday: true)
    elsif(term == "tuesday" || "Tuesday")
      Deal.where(tuesday: true)
    elsif(term == "wednesday" || "Wednesday")
      Deal.where(wednesday: true)
    elsif(term == "thursday" || "Thursday")
      Deal.where(thursday: true)
    elsif(term == "friday" || "Friday")
      Deal.where(friday: true)
    elsif(term == "saturday" || "Saturday")
      Deal.where(saturday: true)
    else
      where("title like :term or description like :term or ethnicity like :term or restaurant_name like :term", term: "%#{term}%")
    end

    
  end
  
  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?
  
    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date") 
    end 
  end
  
end
