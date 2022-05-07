class Commentary < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :post, dependent: :destroy

  validates :text, presence: true
end
