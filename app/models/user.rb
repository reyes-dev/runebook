require 'open-uri'

class User < ApplicationRecord
  after_create :create_profile
  after_create :attach_default_avatar
  after_create :send_welcome_email
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :received_friend_requests, foreign_key: "receiver_id", class_name: "FriendRequest"
  has_many :sent_friend_requests, foreign_key: "sender_id", class_name: "FriendRequest"
  has_many :friendships, dependent: :destroy
  has_many :friendships,
    ->(user) { FriendshipsQuery.both_ways(user_id: user.id) },
    inverse_of: :user,
    dependent: :destroy

    has_many :friends,
      ->(user) { UsersQuery.friends(user_id: user.id, scope: true) },
      through: :friendships
  has_one :profile, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  attr_writer :login
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 5..50 }
  scope :all_except, ->(user) { where.not(id: user) }


  def login
    @login || self.username || self.email
  end

  def friends?(current_user)
    friends.include?(current_user)
  end

  def friend_requested?(current_user)
    received_friend_requests.exists?(sender_id: current_user.id)
  end

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  private

  def create_profile
    Profile.create(user_id: self.id)
  end
  
  def attach_default_avatar
      url = URI.parse("https://res.cloudinary.com/db0puxwjb/image/upload/v1666805770/placeholder-icon_vcawzm.png")
      filename = File.basename(url.path)
      file = URI.open(url)
      self.profile.image.attach(io: file, filename: filename)
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end