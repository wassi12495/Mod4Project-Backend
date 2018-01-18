class FixtureSerializer < ActiveModel::Serializer
  attributes :id, :home, :away, :home_score, :away_score, :date, :status

  belongs_to :league
  belongs_to :team
end
