class UsersController < ApplicationController
  def index
    @users = User.all.includes(:profile).includes(:profile => [image_attachment: :blob]).order("RANDOM()")
    @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
