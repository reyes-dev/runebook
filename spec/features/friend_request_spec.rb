require 'rails_helper'

RSpec.describe 'Friend Request', type: :feature do
  let!(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }

  scenario 'send a friend request and delete it' do
    login_as(user1)
    visit users_path
    click_link(id: "send-friend-request-#{user2.id}")
    expect(page).to have_content('Delete Friend Request')
    click_link(id: "delete-friend-request-#{user2.id}")
    expect(page).to have_content('Send Friend Request')
  end

  scenario 'send a friend request and see it on the receiving users end' do
    login_as(user1)
    visit users_path
    click_link(id: "send-friend-request-#{user2.id}")
    login_as(user2)
    visit user_friend_requests_path(user_id: user2.id)
    expect(page).to have_content(user1.username)
  end

  scenario 'send a friend request and reject it on the receiving users end' do
    login_as(user1)
    visit users_path
    click_link(id: "send-friend-request-#{user2.id}")
    login_as(user2)
    visit user_friend_requests_path(user_id: user2.id)
    expect(page).to have_content(user1.username)
    click_on 'Reject'
    expect(page).not_to have_content(user1.username)
  end
end
