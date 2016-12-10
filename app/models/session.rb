class Deal < ActiveRecord::Base
  # performs simple search based on deal title
  
  
  def self.search(term)
    Deal.where('description LIKE :search OR title LIKE :search OR ethnicity LIKE :search', search: "%#{search}%")
  end

end
