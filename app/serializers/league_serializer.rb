class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :teams

  has_many :teams

end
