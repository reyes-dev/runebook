class ProfilesController < ApplicationController
    def edit
        @profile = Profile.find(params[:id])
        @current_user = current_user

            if current_user.id != @profile.user_id
                flash[:notice] = "You cannot edit another users profile."
                redirect_to edit_profile_path(current_user.id)
                return
            end
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
