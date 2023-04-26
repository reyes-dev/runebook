require 'rails_helper'

RSpec.describe 'Friendship', type: :feature do
    let!(:user1) { FactoryBot.create(:user, id: 1) }
    let!(:user2) { FactoryBot.create(:user, id: 2) }

    scenario 'sent and accepted friend request' do
        login_as(user1)
        visit users_path
        click_on 'Send Friend Request'
        login_as(user2)
        visit user_friend_requests_path(user_id: user2.id)
        click_on 'Accept'
        visit friends_path
        expect(page).to have_content(user1.username)
        login_as(user1)
        visit friends_path
        expect(page).to have_content(user2.username)
    end
end