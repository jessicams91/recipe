require 'rails_helper'

feature 'Visitor visits a user profile' do
  scenario 'successfully' do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)

    visit user_path(user)

    expect(page).to have_content user.name
    expect(page).to have_content user.email
    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.preference.name
    expect(page).to have_content recipe.food_type.name
    expect(page).to have_content recipe.kitchen.name
    expect(page).to have_content recipe.difficulty
    expect(page).to have_content 'Cozinhas'
    expect(page).to have_content 'Preferências'
    expect(page).to have_content 'Tipos'
    expect(page).to have_link recipe.preference.name
    expect(page).to have_link recipe.food_type.name
    expect(page).to have_link recipe.kitchen.name
  end
end
