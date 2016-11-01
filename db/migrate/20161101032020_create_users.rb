class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :email
      t.string :password
      t.string :session_token
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps null: false
    end
  end
end
