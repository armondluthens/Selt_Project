class Deal < ActiveRecord::Base
  # performs simple search based on deal title
  
  
  def self.search(term)
    if deal.sunday == true && Time.now.in_time_zone("Central Time (US & Canada)").sunday?
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    elsif deal.monday == true && Time.now.in_time_zone("Central Time (US & Canada)").monday?
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    elsif deal.tuesday == true && Time.now.in_time_zone("Central Time (US & Canada)").tuesday?
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    elsif deal.wednesday == true && Time.now.in_time_zone("Central Time (US & Canada)").wednesday?
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    elsif deal.thursday == true && Time.now.in_time_zone("Central Time (US & Canada)").thursday?
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    elsif deal.friday == true && Time.now.in_time_zone("Central Time (US & Canada)").friday?
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    elsif deal.saturday == true && Time.now.in_time_zone("Central Time (US & Canada)").saturday?
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    end
  end
  
end
