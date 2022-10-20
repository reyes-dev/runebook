class User < ApplicationRecord
  has_many :posts
  has_many :received_friend_requests, foreign_key: "receiver_id", class_name: "FriendRequest"
  has_many :sent_friend_requests, foreign_key: "sender_id", class_name: "FriendRequest"
  has_many :friendships
  has_many :friendships,
    ->(user) { FriendshipsQuery.both_ways(user_id: user.id) },
    inverse_of: :user,
    dependent: :destroy

    has_many :friends,
      ->(user) { UsersQuery.friends(user_id: user.id, scope: true) },
      through: :friendships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
end
