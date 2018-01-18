class League < ApplicationRecord
  has_many :league_teams
  has_many :teams, through: :league_teams
  has_many :league_fixtures
  has_many :fixtures, through: :league_fixtures




end
