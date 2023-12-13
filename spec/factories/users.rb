FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "factory_user_#{n}" }
    sequence(:email) { |n| "factory_email#{n}@example.com" }
    password { 'password' }
  end
end
