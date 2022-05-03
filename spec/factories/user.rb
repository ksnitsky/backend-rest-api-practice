FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user_#{n}" }
    # email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
  end
end
