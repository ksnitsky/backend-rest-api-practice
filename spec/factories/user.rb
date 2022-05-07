FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user_#{n}" }
    # email { Faker::Internet.email }
    password { '123456' }
  end
end
