require  'rails_helper'

describe 'Administrator creates a new kitchen' do
  scenario 'successfully' do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, scope: :user)
    kitchen = FactoryGirl.create(:kitchen)

    visit new_kitchen_path

    fill_in 'Name',         with: kitchen.name

    click_on 'Criar Cozinha'

    expect(page).to have_content kitchen.name
  end
end
