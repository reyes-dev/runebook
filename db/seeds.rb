require 'faker'
require 'open-uri'

5.times do |i|
    user = User.create!(email: Faker::Internet.email, username: Faker::Name.male_first_name + Faker::Name.last_name, password: Faker::Internet.password(min_length: 10, max_length: 16))

    url = URI.parse("https://xsgames.co/randomusers/assets/avatars/male/#{i}.jpg")
    filename = File.basename(url.path)
    file = URI.open(url)
    user.profile.image.attach(io: file, filename: filename)
    user.profile.update(information: Faker::Lorem.sentence(word_count: 10))
end

5.times do |i|
    user = User.create!(email: Faker::Internet.email, username: Faker::Name.female_first_name + Faker::Name.last_name, password: Faker::Internet.password(min_length: 10, max_length: 16))

    url = URI.parse("https://xsgames.co/randomusers/assets/avatars/female/#{i}.jpg")
    filename = File.basename(url.path)
    file = URI.open(url)
    user.profile.image.attach(io: file, filename: filename)
    user.profile.update(information: Faker::Lorem.sentence(word_count: 10))
end

(1..5).each do |i| 
    User.create(email: "User_#{i}@example.com", username: Faker::Name.name, password: "password")
end



5.times do |i|
    5.times do |x|
        user_id = "10#{i}".to_i
        Friendship.create(user_id: user_id, friend_id: x)
    end
end

3.times do |i|
    3.times do |x|
        user_id = "10#{i}".to_i
        FriendRequest.create(sender_id: x + 1, receiver_id: user_id, received: true)
        FriendRequest.create(sender_id: user_id, receiver_id: x + 1, received: false)
    end
end

(1..5).each do |i|
    Post.create(body: Faker::Lorem.sentence(word_count: 30), user_id: i)
    rand(1..4).times do
        Comment.create(body: Faker::Lorem.sentence(word_count: 10), post_id: Post.last.id, user_id: rand(1..5))
    end
end