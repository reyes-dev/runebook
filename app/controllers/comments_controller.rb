class CommentsController < ApplicationController
    def create
        @comment = Comment.new(body: params[:comment][:body], user_id: current_user.id, post_id: params[:post_id])

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
        params.require(:comment).permit(:body, :user_id, :post_id)
    end
end
