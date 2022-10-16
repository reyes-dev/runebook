class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  validates_uniqueness_of :sender_id, scope: :receiver_id
end