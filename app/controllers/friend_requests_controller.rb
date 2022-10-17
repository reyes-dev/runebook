class FriendRequestsController < ApplicationController
  def create
    unless params[:friend_request][:receiver_id].to_i == current_user.id
      @friend_request = FriendRequest.create friend_request_params
      @reverse_friend_request = FriendRequest.create(:sender_id => friend_request_params[:receiver_id], :receiver_id => friend_request_params[:sender_id])
    end

    redirect_to users_path
  end

  def destroy
  end

  private 

  def friend_request_params
    params.require(:friend_request).permit(:sender_id, :receiver_id)
  end
end