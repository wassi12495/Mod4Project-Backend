class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :points, :wins, :losses, :draws, :img, :api_url

  belongs_to :leagues
end
