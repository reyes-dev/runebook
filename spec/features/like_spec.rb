require 'rails_helper'

RSpec.describe 'Like', type: :feature, js: true do
  let!(:user1) { FactoryBot.create(:user) }

  scenario 'like a post' do
    login_as(user1)

    visit posts_path
    fill_in 'post[body]', with: 'post text'
    click_button 'Submit Post'

    visit posts_path
    sleep 3.seconds
    expect(page).to have_content(' x 0')

    click_on 'like-link'
    sleep 3.seconds
    expect(page).to have_content(' x 1')
  end

  scenario 'unlike a post' do
    login_as(user1)

    visit posts_path
    fill_in 'post[body]', with: 'post text'
    click_button 'Submit Post'

    visit posts_path
    sleep 3.seconds
    expect(page).to have_content(' x 0')

    click_on 'like-link'
    sleep 3.seconds
    expect(page).to have_content(' x 1')

    click_on 'unlike-link'
    sleep 3.seconds
    expect(page).to have_content(' x 0')
  end
end
