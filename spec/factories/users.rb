FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    sequence(:email) { |n| "tester#{n}@lewagon.com" }
    password { "my-very-secured-password" }
  end
end
