class ChangeAvailableDefaultOnGames < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:games, :available, true)
  end
end
