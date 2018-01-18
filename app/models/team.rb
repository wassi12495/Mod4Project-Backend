class Team < ApplicationRecord
  has_many :league_teams
  has_many :leagues, through: :league_teams
  has_many :team_fixtures
  has_many :fixtures, through: :team_fixtures
  
end
