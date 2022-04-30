class User < ApplicationRecord
  has_many :posts, dependent: :delete_all

  has_secure_password
end
