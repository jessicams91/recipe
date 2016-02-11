require 'rails_helper'

describe 'user can edit recipes he created' do
  scenario 'successfully' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)

    # visit edit_user_registration_path
    #
    # fill_in 'Email', with: user.email
    # fill_in 'City', with: user.city
    # fill_in 'Name', with: 'Jessica'
    # select user.preference.name, from: 'Preference'
    # click_on 'Update'
    #
    # visit '/users/1'
    # expect(page).to have_content 'Jessica'
  end
end
