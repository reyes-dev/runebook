require 'faker'

100.times do
    User.create!(email: Faker::Internet.email, username: Faker::Name.name, password: Faker::Internet.password(min_length: 10, max_length: 16))
end