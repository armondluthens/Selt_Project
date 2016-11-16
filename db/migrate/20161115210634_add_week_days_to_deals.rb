class AddWeekDaysToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :ethnicity, :string
    
    add_column :deals, :sunday, :boolean, default: false
    add_column :deals, :monday, :boolean, default: false
    add_column :deals, :tuesday, :boolean, default: false
    add_column :deals, :wednesday, :boolean, default: false
    add_column :deals, :thursday, :boolean, default: false
    add_column :deals, :friday, :boolean, default: false
    add_column :deals, :saturday, :boolean, default: false
  end
end
