class AddGamecoversToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :gamecovers, :string
  end
end
