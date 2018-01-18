class CreateLeagueTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :league_teams do |t|
      t.belongs_to :league, foreign_key: true
      t.belongs_to :team, foreign_key: true

      t.timestamps
    end
  end
end
