class Fixture < ApplicationRecord


  has_many :league_fixtures
  has_many :leagues, through: :league_fixtures
  has_many :team_fixtures
  has_many :team, through: :team_fixtures

end
