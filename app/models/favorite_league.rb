class FavoriteLeague < ApplicationRecord
  belongs_to :user
  belongs_to :league
end
