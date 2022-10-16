class PostsController < ApplicationController
  def index
    @posts = current_user.posts
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
  end
end
