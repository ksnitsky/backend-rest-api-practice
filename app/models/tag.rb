class Tag < ApplicationRecord
  has_many :post_tags
  has_many :posts, through: :post_tags

  validates :title,
            presence: true,
            uniqueness: true,
            length: { minimum: 2 }
end
