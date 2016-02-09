require 'rails_helper'

describe 'Visitor clicks on' do
  scenario 'kitchen and sees recipes' do
    recipe = FactoryGirl.create(:recipe)

    visit root_path

    click_on recipe.kitchen.name

    expect(page).to have_content recipe.kitchen.name
    expect(page).to have_content recipe.name
  end

  scenario 'food type and sees recipes' do
    recipe = FactoryGirl.create(:recipe)

    visit root_path

    click_on recipe.food_type.name

    expect(page).to have_content recipe.food_type.name
    expect(page).to have_content recipe.name
  end

  scenario 'preference and sees recipes' do
    recipe = FactoryGirl.create(:recipe)

    visit root_path

    click_on recipe.preference.name

    expect(page).to have_content recipe.preference.name
    expect(page).to have_content recipe.name
  end
end
