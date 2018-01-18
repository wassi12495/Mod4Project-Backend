class CreateLeagueFixtures < ActiveRecord::Migration[5.1]
  def change
    create_table :league_fixtures do |t|
      t.belongs_to :league, foreign_key: true
      t.belongs_to :fixture, foreign_key: true

      t.timestamps
    end
  end
end
