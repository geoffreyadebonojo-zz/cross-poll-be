class User < ApplicationRecord
  has_many :user_favorites
  has_many :favorites, through: :user_favorites
  before_create :get_api_token
  has_secure_password

  validates_presence_of :first_name,
                        :last_name,
                        :password

  validates :email, presence: true, uniqueness: true

  private

  def get_api_token
    self.api_token = SecureRandom.uuid
  end

end
