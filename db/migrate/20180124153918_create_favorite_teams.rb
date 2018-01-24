class CreateFavoriteTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_teams do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :team, foreign_key: true

      t.timestamps
    end
  end
end
