require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'associations' do
    it { should have_many(:post_tags) }
    it { should have_many(:posts) }
  end

  describe 'validations' do
    subject { FactoryBot.build(:tag) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_length_of(:title).is_at_least(2) }
  end
end
