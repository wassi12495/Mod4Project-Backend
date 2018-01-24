class CreateFavoriteLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_leagues do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :league, foreign_key: true

      t.timestamps
    end
  end
end
