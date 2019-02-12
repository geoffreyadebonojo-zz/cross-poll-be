class User < ApplicationRecord
  has_secure_password

  validates_presence_of :first_name,
                        :last_name,
                        :email,
                        :password

  validates :email, presence: true, uniqueness: true

  def pets
  end
end
