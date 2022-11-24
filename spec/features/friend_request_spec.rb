require 'rails_helper'

RSpec.describe 'Friend Request', type: :feature, :js => true do
    let!(:user1) { FactoryBot.create(:user, id: 1) }
    let!(:user2) { FactoryBot.create(:user, id: 2) }

    scenario 'send a friend request and delete it' do
        login_as(user1)
        visit users_path
        click_on 'Send Friend Request'
        expect(page).to have_content('Delete Friend Request')
        click_on 'Delete Friend Request'
        expect(page).to have_content('Send Friend Request')
    end
end