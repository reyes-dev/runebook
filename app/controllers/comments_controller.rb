class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build comment_params
        @comment.user = current_user
        if @comment.save
            redirect_to posts_path
        else
            redirect_to posts_path, status: :unprocessable_entity
        end
    end

    def destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :post_id, :comment => [ :body ])
    end
end
