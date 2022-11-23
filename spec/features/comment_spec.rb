require 'rails_helper'

RSpec.describe 'Comment', type: :feature, :js => true do
    let!(:user1) { FactoryBot.create(:user, id: 1) }
    let!(:post1) { FactoryBot.create(:post, user: user1) }

    scenario 'valid inputs' do
        login_as(user1)
        visit posts_path
        click_button 'Comment'
        fill_in 'comment_body', with: 'comment text'
        click_on 'Post Comment'
        visit posts_path
        # sleep 3.seconds
        expect(page).to have_content('comment text')
    end

    scenario 'invalid inputs' do
        login_as(user1)
        visit posts_path
        click_button 'Comment'
        fill_in 'comment_body', with: ' '
        click_on 'Post Comment'
        sleep 3.seconds
        expect(page).to have_content('Invalid comment.')
    end
end