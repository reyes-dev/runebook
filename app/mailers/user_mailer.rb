class UserMailer < ApplicationMailer
    default from: 'runebooktop@gmail.com'

    def welcome_email
        @user = params[:user]
        @url  = 'http://localhost:3000/'
        mail(to: @user.email, subject: 'Welcome to Runebook')
    end
end
