class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :title
      t.datetime :start_date 
      t.datetime :end_date
      t.string :description

      t.timestamps null: false
    end
  end
end
