require 'rails_helper'

RSpec.describe Commentary, type: :model do
  describe 'associations' do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:text) }
  end

  describe '#change_rating' do
    it 'should return 1 if change_rating(1)' do
      comment = create(:commentary)
      expect(comment.change_rating(1)).to be_truthy

      expect(comment.rating).to eq 1
    end

    it 'should return -1 if change_rating(-1)' do
      comment = create(:commentary)
      expect(comment.change_rating(-1)).to be_truthy

      expect(comment.rating).to eq -1
    end
  end
end
