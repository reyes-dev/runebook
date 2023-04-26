class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.build comment_params
        @comment.user = current_user
        if @comment.save
            flash[:success] = "Comment created successfully!"
        else
            flash[:comment_error] = "Invalid comment #{@post.id}"
        end
        redirect_back(fallback_location: posts_path)
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
    
        redirect_to request.referrer
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :post_id, :comment => [ :body ])
    end
end
