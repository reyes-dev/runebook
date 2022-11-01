require 'faker'
require 'open-uri'

50.times do |i|
    user = User.create!(email: Faker::Internet.email, username: Faker::Name.male_first_name + Faker::Name.last_name, password: Faker::Internet.password(min_length: 10, max_length: 16))

    url = URI.parse("https://xsgames.co/randomusers/assets/avatars/male/#{i}.jpg")
    filename = File.basename(url.path)
    file = URI.open(url)
    user.profile.image.attach(io: file, filename: filename)
end

50.times do |i|
    user = User.create!(email: Faker::Internet.email, username: Faker::Name.female_first_name + Faker::Name.last_name, password: Faker::Internet.password(min_length: 10, max_length: 16))

    url = URI.parse("https://xsgames.co/randomusers/assets/avatars/female/#{i}.jpg")
    filename = File.basename(url.path)
    file = URI.open(url)
    user.profile.image.attach(io: file, filename: filename)
end

5.times { |i| User.create(email: "User_#{i}@runebook.moe", username: Faker::Name.name, password: "password") }