class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :daily_rent
      t.integer :min_rent_period
      t.boolean :available, default: false
      t.string :title
      t.integer :released_year
      t.string :brand
      t.string :genre
      t.string :console
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
