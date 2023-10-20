require 'faker'
require 'open-uri'

user = User.create!(email: 'guest@example.com', username: 'Guest', password: 'password')

5.times do |i|
  user = User.create!(email: Faker::Internet.email, username: Faker::Name.male_first_name + Faker::Name.last_name,
                      password: Faker::Internet.password(min_length: 10, max_length: 16))

  url = URI.parse("https://xsgames.co/randomusers/assets/avatars/male/#{i}.jpg")
  filename = File.basename(url.path)
  file = URI.open(url)
  user.profile.image.attach(io: file, filename:)
  user.profile.update(information: Faker::Lorem.sentence(word_count: 10))
end

5.times do |i|
  user = User.create!(email: Faker::Internet.email, username: Faker::Name.female_first_name + Faker::Name.last_name,
                      password: Faker::Internet.password(min_length: 10, max_length: 16))

  url = URI.parse("https://xsgames.co/randomusers/assets/avatars/female/#{i}.jpg")
  filename = File.basename(url.path)
  file = URI.open(url)
  user.profile.image.attach(io: file, filename:)
  user.profile.update(information: Faker::Lorem.sentence(word_count: 10))
end

(1..5).each do |i|
  User.create(email: "User_#{i}@example.com", username: Faker::Name.name, password: 'password')
end

5.times do |i|
  5.times do |x|
    user_id = "1#{i}".to_i
    Friendship.create(user_id:, friend_id: x)
  end
end

5.times do |i|
  3.times do |x|
    user_id = "1#{i}".to_i
    FriendRequest.create(sender_id: x + 1, receiver_id: user_id, received: true)
    FriendRequest.create(sender_id: user_id, receiver_id: x + 1, received: false)
  end
end

(1..5).each do |i|
  post = Post.create(body: Faker::Lorem.sentence(word_count: 30), open: false, user_id: i)
  rand(1..4).times do
    Comment.create(body: Faker::Lorem.sentence(word_count: 10), post_id: post.id, user_id: rand(1..5))
  end
end
