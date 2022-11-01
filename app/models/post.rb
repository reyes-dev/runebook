class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :image
  validate :has_text_or_image
  validates_length_of :body, :maximum => 280
  
  def self.relevant_posts(current_user) 
    where(user_id: current_user.id).or(where(user_id: current_user.friends.ids)).order(created_at: :desc)
  end

  def liked?(current_user)
    # self.likes.any? && self.likes.first.user == current_user
    self.likes.exists?(user_id: current_user.id)
  end

  def user_like(current_user)
    # likes.where(user: current_user).first.id
    likes.find_by(user: current_user)
  end

  def has_text_or_image
    unless [body, image].any?{ |val| val.present? }
      errors.add :base, 'You need to enter some text or a attach an image!'
    end
  end
end