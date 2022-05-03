class User < ApplicationRecord
  has_many :posts, dependent: :delete_all

  has_secure_password

  validates :username,
            presence: true,
            uniqueness: true,
            length: { in: 3..15 }
  # validates :email,
  #           presence: true,
  #           uniqueness: true,
  #           email: true
  validates :password,
            presence: true,
            length: { minimum: 6 }
end
