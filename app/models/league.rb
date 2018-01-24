class League < ApplicationRecord
  has_many :league_teams
  has_many :teams, through: :league_teams
  has_many :league_fixtures
  has_many :fixtures, through: :league_fixtures
  has_many :favorite_leagues
  has_many :users, through: :favorite_leagues



end
