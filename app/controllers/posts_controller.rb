class PostsController < ApplicationController
  def index
    @post = Post.new
    @open_filter = params[:open] || 'false'

    case @open_filter
    when 'true'
      @posts = Post.open_posts(current_user).includes(:comments)
    when 'false'
      @posts = Post.where(open: false).includes(:comments).order(created_at: :desc)
    end  
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      flash[:success] = "Post created successfully!"
    else
      flash[:post_error] = "Invalid post"
    end
    redirect_back(fallback_location: posts_path)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to request.referrer
  end

  private

  def post_params
    params.require(:post).permit(:body, :image, :open)
  end
end
