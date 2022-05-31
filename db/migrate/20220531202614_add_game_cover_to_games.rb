class AddGameCoverToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :gamecover, :string
  end
end
