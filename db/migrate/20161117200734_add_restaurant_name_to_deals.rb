class AddRestaurantNameToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :restaurant_name, :string
  end
end
