require 'rails_helper'

feature 'User creates a new recipe' do
  scenario 'successfuly' do
    recipe = Recipe.new(name: 'Feijoada',
                        kitchen: 'Brasileira',
                        food_type: 'Principal',
                        preference: 'Carnes',
                        servings: '6',
                        cook_time: ':30',
                        difficulty: 'Media',
                        step_by_step: 'Cortar tudo',
                        ingredients: 'Feijão e etc')

  visit new_recipe_path

  fill_in 'Name',         with: recipe.name
  fill_in 'Kitchen',      with: recipe.kitchen
  fill_in 'Food type',    with: recipe.food_type
  fill_in 'Preference',   with: recipe.preference
  fill_in 'Servings',     with: recipe.servings
  fill_in 'Cook time',    with: recipe.cook_time
  fill_in 'Step by step', with: recipe.step_by_step
  fill_in 'Ingredients',  with: recipe.ingredients
  fill_in 'Difficulty',   with: recipe.difficulty
  
  click_on 'Criar Receita'

  expect(page).to have_content recipe.name
  expect(page).to have_content recipe.kitchen
  expect(page).to have_content recipe.food_type
  expect(page).to have_content recipe.preference
  expect(page).to have_content recipe.servings
  expect(page).to have_content recipe.cook_time
  expect(page).to have_content recipe.step_by_step
  expect(page).to have_content recipe.ingredients
  expect(page).to have_content recipe.difficulty
  end
end
