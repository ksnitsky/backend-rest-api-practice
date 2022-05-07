FactoryBot.define do
  factory :commentary do
    text { Faker::GreekPhilosophers.quote }
    user { create(:user) }
    post { create(:post) }
  end
end
