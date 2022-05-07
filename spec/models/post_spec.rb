require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:category) }
    it { should belong_to(:user) }
    it { should have_many(:tags) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:title).is_at_least(3) }
  end

  describe '#change_rating' do
    it 'should return 1 if change_rating(1)' do
      post = create(:post)
      expect(post.change_rating(1)).to be_truthy

      expect(post.rating).to eq 1
    end

    it 'should return -1 if change_rating(-1)' do
      post = create(:post)
      expect(post.change_rating(-1)).to be_truthy

      expect(post.rating).to eq -1
    end
  end
end
