class AddPasswordDigestToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :password_digest, :string
    remove_column :restaurants, :password, :string
    remove_column :restaurants, :invitationID, :integer
  end
end
