require  'rails_helper'

describe 'Administrator creates a new preference' do
  scenario 'successfully' do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, scope: :user)
    preference = FactoryGirl.create(:preference)

    visit new_preference_path

    fill_in 'Name',         with: preference.name

    click_on 'Criar Preferência'

    expect(page).to have_content preference.name
  end
end
