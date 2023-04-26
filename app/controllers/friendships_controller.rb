class FriendshipsController < ApplicationController
    def create
        @friendship = Friendship.create friendship_params
        FriendRequest.destroy_FR(friendship_params[:friend_id], friendship_params[:user_id])

        redirect_to user_friend_requests_path(current_user.id)
    end

    def destroy
    end

    private

    def friendship_params
        params.require(:friendship).permit(:user_id, :friend_id)
    end
end
