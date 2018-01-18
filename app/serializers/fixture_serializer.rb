class FixtureSerializer < ActiveModel::Serializer
  attributes :id, :home, :away, :home_score, :away_score, :date, :status
end
