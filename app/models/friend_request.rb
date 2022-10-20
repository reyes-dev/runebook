class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  validates_uniqueness_of :sender_id, scope: :receiver_id

  def self.destroy_FR(sender_id, receiver_id)
    FriendRequest.where(sender_id: sender_id, receiver_id: receiver_id).destroy_all
    FriendRequest.where(sender_id: receiver_id, receiver_id: sender_id).destroy_all
  end
end