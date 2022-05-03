FactoryBot.define do
  factory :post do
    title { Faker::GreekPhilosophers.quote }
    content { Faker::Lorem.paragraph }
    category_title { create(:category).title }
    author_id { create(:user).id }
    tag_list { Faker::Hipster.words(number: 3).join(', ') }
  end
end
