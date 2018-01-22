class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name,:api_id, :img, :teams

  has_many :fixtures
  has_many :teams


end
