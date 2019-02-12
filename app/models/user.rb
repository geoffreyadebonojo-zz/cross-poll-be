class User < ApplicationRecord
  attr_reader :message
  has_secure_password

  validates_presence_of :first_name,
                        :last_name,
                        :email,
                        :password

  validates :email, presence: true, uniqueness: true

  def message
    "Account successfully created for new user."
  end
end
