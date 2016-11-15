class UpdateDeals < ActiveRecord::Migration
  def change
    change_table 'deals' do |t|
      t.time :start_time, :end_time
      t.text :deal_days
      t.references :restaurant
    end
    change_column :deals, :start_date, :date
    change_column :deals, :end_date, :date
    
    add_column :deals, :ethnicity, :string
    
    add_column :deals, :sunday, string
    add_column :deals, :monday, string
    add_column :deals, :tuesday, string
    add_column :deals, :wednesday, string
    add_column :deals, :thursday, string
    add_column :deals, :friday, string
    add_column :deals, :saturday, string
  end
end
