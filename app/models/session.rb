class Deal < ActiveRecord::Base
  # performs simple search based on deal title
  
  
  def self.search(term)
    where("title like :term or description like :term", term: "%#{term}%")
  end

end
