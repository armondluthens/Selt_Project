class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :title
      t.string :ethnicity
      t.string :restaurant_name

      t.timestamps null: false
    end
  end
end
