require 'rails_helper'

describe 'user can edit recipes he created' do
  scenario 'successfully' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    FactoryGirl.create(:recipe, user: user)
    binding.pry

    visit edit_user_registration_path(user)

    fill_in 'Name', with: 'Jessica'
    fill_in 'Current password', with: user.password
    click_on 'Update'


    visit user_path(user)

    expect(page).to have_content 'Jessica'
  end
end
