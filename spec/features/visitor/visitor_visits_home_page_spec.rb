require 'rails_helper'

feature 'Visitor visits Social Recipes home page' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_content('Social Recipes')
  end

  scenario 'and views recipes' do
    recipe = FactoryGirl.create(:recipe)

  visit root_path

  expect(page).to have_content recipe.name
  expect(page).to have_content recipe.kitchen
  expect(page).to have_content recipe.food_type
  expect(page).to have_content recipe.preference
  expect(page).to have_content recipe.difficulty
  expect(page).to_not have_content recipe.step_by_step
  expect(page).to have_link recipe.name
  end
end
