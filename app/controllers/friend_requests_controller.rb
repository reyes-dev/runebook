class FriendRequestsController < ApplicationController
  def index
    @friend_requests = FriendRequest.where(receiver_id: current_user.id, received: true)
  end

  def create
    unless params[:friend_request][:receiver_id].to_i == current_user.id
      @friend_request = FriendRequest.create friend_request_params
      @reverse_friend_request = FriendRequest.create(:sender_id => friend_request_params[:receiver_id], :receiver_id => friend_request_params[:sender_id], :received => false)
    end

    redirect_to users_path
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    @placeholder_friend_request = FriendRequest.find(FriendRequest.where(receiver_id: @friend_request.sender_id).first.id)

    @friend_request.destroy
    @placeholder_friend_request.destroy

    redirect_to user_friend_requests_path
  end

  private 

  def friend_request_params
    params.require(:friend_request).permit(:sender_id, :receiver_id, :received)
  end
end