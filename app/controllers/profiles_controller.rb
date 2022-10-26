class ProfilesController < ApplicationController
    def edit
        @profile = Profile.find(params[:id])
    end

    def update
        @profile = Profile.find(params[:id])
        
        if @profile.update profile_params
            redirect_to edit_profile_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def profile_params
        params.require(:profile).permit(:information, :image)
    end
end
