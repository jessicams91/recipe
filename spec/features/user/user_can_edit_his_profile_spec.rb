require 'rails_helper'

feature 'User edit his profile' do
  scenario 'successfully' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    FactoryGirl.create_list(:kitchen, 5)
    visit edit_user_registration_path(user)

    fill_in 'Name',     with: user.name
    fill_in 'City',     with: user.city
    fill_in 'Email',    with: user.email
    fill_in 'Facebook', with: user.facebook
    fill_in 'Twitter',  with: user.twitter
    check   'kitchen_1'
    check   'kitchen_2'
    fill_in 'Current password', with: user.password

    click_on 'Update'

    visit user_path(user)

    expect(page).to have_content user.name
  end

  scenario 'try to edit another user profile' do
    user = FactoryGirl.create(:user)
    other_user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    FactoryGirl.create_list(:kitchen, 5)
    visit edit_user_registration_path(other_user)

    fill_in 'Name',     with: user.name
    fill_in 'City',     with: user.city
    fill_in 'Email',    with: user.email
    fill_in 'Facebook', with: user.facebook
    fill_in 'Twitter',  with: user.twitter
    check   'kitchen_1'
    fill_in 'Current password', with: user.password

    click_on 'Update'

    visit user_path(other_user)

    expect(page).to have_content other_user.name
  end
end
