class AddAddressToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :address, :string
  end
end
