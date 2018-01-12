FactoryBot.define do
  factory :user do
    email {"user_#{Random.rand(1000).to_s}@factory.com" }
    first_name 'FirstName'
    last_name 'LastName'

  end
end
