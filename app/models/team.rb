class Team < ApplicationRecord
  has_many :league_teams
  has_many :leagues, through: :league_teams
  has_many :team_fixtures
  has_many :fixtures, through: :team_fixtures
  has_many :favorite_teams
  has_many :users, through: :favorite_teams

end
