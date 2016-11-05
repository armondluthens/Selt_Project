class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :password
      t.string :email
      t.string :contact
      t.string :location
      t.string :description
      t.integer :invitationID
      t.string :session_token
      t.timestamps null: false
    end
  end
end
