class LikesController < ApplicationController
    def create
        @like = Like.new like_params
        @like.user = current_user
        if @like.save
            redirect_to request.referer
        else
            redirect_to request.referer, status: :unprocessable_entity
        end
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy

        redirect_to request.referer
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
    end
end
