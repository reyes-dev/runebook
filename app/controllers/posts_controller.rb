class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.relevant_posts(current_user)
    @current_user = current_user
  end

  def create
    @post = Post.new post_params
    @posts = Post.relevant_posts(current_user)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to request.referrer
  end

  private

  def post_params
    params.require(:post).permit(:body, :image)
  end
end
