class UserFavorite < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :favorite, foreign_key: "favorite_id"
end
