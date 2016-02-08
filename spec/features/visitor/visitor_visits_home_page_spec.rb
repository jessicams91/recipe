require 'rails_helper'

feature 'Visitor visits Social Recipes home page' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_content('Social Recipes')
  end

  scenario 'and views recipes' do
    kitchen = FactoryGirl.create(:kitchen)
    food_type = FactoryGirl.create(:food_type)
    preference = FactoryGirl.create(:preference)
    recipe = FactoryGirl.create(:recipe, kitchen: kitchen, food_type: food_type, preference: preference)

  visit root_path

  expect(page).to have_content recipe.name
  expect(page).to have_content kitchen.name
  expect(page).to have_content food_type.name
  expect(page).to have_content preference.name
  expect(page).to have_content recipe.difficulty
  expect(page).to_not have_content recipe.step_by_step
  expect(page).to have_link recipe.name
  end
end
