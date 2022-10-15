class User < ApplicationRecord
  has_many :received_friend_requests, foreign_key: "receiver_id", class_name: "FriendRequest"
  has_many :sent_friend_requests, foreign_key: "sender_id", class_name: "FriendRequest"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
end
