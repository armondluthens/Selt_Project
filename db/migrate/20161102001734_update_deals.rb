class UpdateDeals < ActiveRecord::Migration
  def change
    change_table 'deals' do |t|
      t.time :start_time, :end_time
      t.text :deal_days
      t.references :restaurant
    end
    change_column :deals, :start_date, :date
    change_column :deals, :end_date, :date
  end
end
