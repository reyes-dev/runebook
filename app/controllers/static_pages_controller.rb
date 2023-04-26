class StaticPagesController < ApplicationController
    def about
    end

    def search
        @query = params[:query].downcase
        @users = User.where('LOWER(username) LIKE ?', "%#{@query}%")
                     .order(:username)    
    end

    def friends
        @friends = current_user.friends
    end
end
