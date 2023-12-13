require 'rails_helper'

RSpec.describe 'Friendship', type: :feature, js: true do
  let!(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }

  scenario 'sent and accepted friend request' do
    login_as(user1)
    visit users_path
    click_on('Send Friend Request', id: "send-friend-request-#{user2.id}")
    sleep 3.seconds
    login_as(user2)
    visit user_friend_requests_path(user_id: user2.id)
    click_on 'Accept'
    sleep 3.seconds
    visit friends_path
    expect(page).to have_content(user1.username)
  end

  after(:each) do
    user1.destroy if user1.present?
    user2.destroy if user2.present?
  end
end
