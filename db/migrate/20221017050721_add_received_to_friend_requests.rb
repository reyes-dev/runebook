class AddReceivedToFriendRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :friend_requests, :received, :boolean
  end
end
