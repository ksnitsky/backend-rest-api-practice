class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title,
            presence: true,
            length: { minimum: 3 }
  validates :content,
            presence: true

  def category_title=(category)
    new_or_found_category = Category.find_or_create_by(title: category.downcase)
    self.category = new_or_found_category
  end

  def tag_list=(tags_str)
    tags = tags_str.split(',').collect { |tag| tag.strip.downcase }
    new_or_found_tags = tags.collect { |tag| Tag.find_or_create_by(title: tag) }
    self.tags = new_or_found_tags
  end

  def author_id=(user_id)
    user = User.find_by(id: user_id)
    self.user = user
  end
end
