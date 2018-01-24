class User < ApplicationRecord
  has_secure_password
  has_many :favorite_teams
  has_many :favorite_leagues
  has_many :teams, through: :favorite_teams
  has_many :leagues, through: :favorite_leagues
end
