FactoryBot.define do
  factory :admin do
    sequence(:username) { |n| "username-#{n}" }
    email 'nesto@mail.com'
    password 'abc123'
  end
end
