class UsersController < ApplicationController
  def index
    @users = User.all_except(current_user).includes(:profile).includes(:profile => [image_attachment: :blob]).includes(:received_friend_requests).order("RANDOM()")
    @current_user = current_user
  end

  def show
    @current_user = User.find(params[:id])
    @posts = @current_user.posts
  end
end
