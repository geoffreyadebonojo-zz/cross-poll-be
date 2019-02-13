class User < ApplicationRecord
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
