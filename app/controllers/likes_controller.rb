class LikesController < ApplicationController
    def create
        @like = Like.new like_params
        @like.user = current_user
        if @like.save
            redirect_to posts_path
        else
            redirect_to posts_path, status: :unprocessable_entity
        end
    end

    def destroy
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
    end
end
