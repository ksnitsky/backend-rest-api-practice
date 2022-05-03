class Category < ApplicationRecord
  before_save :downcase_title
  has_many :posts, dependent: :destroy

  validates :title,
            presence: true,
            uniqueness: true,
            length: { minimum: 3 }

  private

  def downcase_title
    self.title = title.downcase
  end
end
