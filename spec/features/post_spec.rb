require 'rails_helper'

RSpec.describe 'Post', type: :feature, js: true do
  let!(:user1) { FactoryBot.create(:user) }

  scenario 'valid inputs' do
    login_as(user1)
    visit posts_path
    fill_in 'post[body]', with: 'post text'
    click_button 'Submit Post'
    visit posts_path
    # sleep 3.seconds
    expect(page).to have_content('post text')
  end

  scenario 'invalid inputs' do
    login_as(user1)
    visit posts_path
    fill_in 'post[body]', with: ' '
    click_button 'Submit Post'
    # sleep 3.seconds
    expect(page).to have_content('Invalid post')
  end
end

