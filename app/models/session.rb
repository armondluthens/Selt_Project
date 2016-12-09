class Deal < ActiveRecord::Base
  # performs simple search based on deal title
  
  
  def self.search(term)

    if Deal.sunday == true && Time.now.in_time_zone("Central Time (US & Canada)").sunday?
    #if Time.now.in_time_zone("Central Time (US & Canada)").sunday?
    #if Deal.sunday == true
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    elsif Deal.monday == true && Time.now.in_time_zone("Central Time (US & Canada)").monday?
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    elsif Deal.tuesday == true && Time.now.in_time_zone("Central Time (US & Canada)").tuesday?
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    elsif Deal.wednesday == true && Time.now.in_time_zone("Central Time (US & Canada)").wednesday?
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    elsif Deal.thursday == true && Time.now.in_time_zone("Central Time (US & Canada)").thursday?
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    elsif Deal.friday == true && Time.now.in_time_zone("Central Time (US & Canada)").friday?
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    elsif Deal.saturday == true && Time.now.in_time_zone("Central Time (US & Canada)").saturday?
      where("title like :term or description like :term or restaurant_name like :term", term: "%#{term}%")
    end

  end


end
