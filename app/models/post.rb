class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :body, presence: true
  validates_length_of :body, :maximum => 280
  
  def self.relevant_posts(current_user) 
    where(user_id: current_user.id).or(where(user_id: current_user.friends.ids)).order(created_at: :desc)
  end

  def liked?(current_user)
    # self.likes.any? && self.likes.first.user == current_user
    self.likes.where(user_id: current_user.id).any?
  end

  def user_like(current_user)
    likes.where(user: current_user).first.id
  end
end