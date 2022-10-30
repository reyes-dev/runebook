class Comment < ApplicationRecord
  has_many :likes, as: :likeable, dependent: :destroy
  belongs_to :post
  belongs_to :user
  validates :body, :user_id, :post_id, presence: true
end
