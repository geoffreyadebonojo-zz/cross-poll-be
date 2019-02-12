class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username,
                        :first_name,
                        :last_name
                        :password

  validates :email, presence: true, uniqueness: true
end
