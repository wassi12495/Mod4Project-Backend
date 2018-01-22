class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name,:api_id, :teams

  has_many :teams

end
