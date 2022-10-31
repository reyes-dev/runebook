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
    @friend_request = FriendRequest.find_by(sender_id: params[:user_id], receiver_id: params[:id])
    @placeholder_friend_request = FriendRequest.find_by(receiver_id: params[:user_id], sender_id: params[:id])

    @friend_request.destroy
    @placeholder_friend_request.destroy

    redirect_to request.referrer
  end

  private 

  def friend_request_params
    params.require(:friend_request).permit(:sender_id, :receiver_id, :received)
  end
end