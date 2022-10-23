class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :body, presence: true
  validates_length_of :body, :maximum => 280
  
  def self.relevant_posts(current_user) 
    where(user_id: current_user.id).or(where(user_id: current_user.friends.ids)).order(created_at: :desc)
  end
end