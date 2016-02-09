require 'rails_helper'

describe 'Visitor clicks on' do
  scenario 'kitchen and sees recipes' do
    user = FactoryGirl.create(:user)
    recipe = FactoryGirl.create(:recipe, user: user)

    visit root_path

    login_as(user, scope: :user)

    click_on recipe.kitchen.name

    expect(page).to have_content recipe.kitchen.name
    expect(page).to have_content recipe.name
  end

  scenario 'food type and sees recipes' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    recipe = FactoryGirl.create(:recipe, user: user)

    visit root_path

    click_on recipe.food_type.name

    expect(page).to have_content recipe.food_type.name
    expect(page).to have_content recipe.name
  end

  scenario 'preference and sees recipes' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    recipe = FactoryGirl.create(:recipe, user: user)

    visit root_path

    click_on recipe.preference.name

    expect(page).to have_content recipe.preference.name
    expect(page).to have_content recipe.name
  end
end
