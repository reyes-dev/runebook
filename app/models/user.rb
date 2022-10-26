class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
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
  has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
  attr_writer :login
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 5..50 }


  def login
    @login || self.username || self.email
  end

  def friends?(current_user)
    friendships.where(friend_id: current_user.id).any? || friendships.where(user_id: current_user.id).any?
  end

  def friend_requested?(current_user)
    FriendRequest.where(receiver_id: current_user.id).where(sender_id: self.id).any?
  end
end
