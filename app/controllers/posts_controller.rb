class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.relevant_posts(current_user)
    @comment = Comment.new
  end

  def new
  end

  def show
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
