require 'rails_helper'

RSpec.describe 'Like', type: :feature do
  let!(:user1) { FactoryBot.create(:user) }
  let!(:post1) { FactoryBot.create(:post, user: user1) }

  scenario 'like a post' do
    login_as(user1)
    visit posts_path
    expect(page).to have_content(' x 0')
    click_on 'like-link'
    expect(page).to have_content(' x 1')
  end

  scenario 'unlike a post' do
    login_as(user1)
    visit posts_path
    expect(page).to have_content(' x 0')
    click_on 'like-link'
    expect(page).to have_content(' x 1')
    click_on 'unlike-link'
    expect(page).to have_content(' x 0')
  end
end

