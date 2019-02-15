class Favorite < ApplicationRecord
  has_many :user_favorites
  has_many :users, through: :user_favorites
  validates_presence_of :favorite_id

end
