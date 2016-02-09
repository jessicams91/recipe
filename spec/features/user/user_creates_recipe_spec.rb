require 'rails_helper'

describe 'User creates a new recipe' do
  scenario 'successfuly' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    recipe = FactoryGirl.create(:recipe, user: user)

    visit new_recipe_path

    fill_in 'Name',         with: recipe.name
    select recipe.kitchen.name,   from: 'Kitchen'
    select recipe.food_type.name, from: 'Food type'
    select recipe.preference.name, from: 'Preference'
    fill_in 'Servings',     with: recipe.servings
    fill_in 'Cook time',    with: recipe.cook_time
    fill_in 'Step by step', with: recipe.step_by_step
    fill_in 'Ingredients',  with: recipe.ingredients
    fill_in 'Difficulty',   with: recipe.difficulty

    click_on 'Criar Receita'

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.kitchen.name
    expect(page).to have_content recipe.food_type.name
    expect(page).to have_content recipe.preference.name
    expect(page).to have_content recipe.servings
    expect(page).to have_content recipe.cook_time
    expect(page).to have_content recipe.step_by_step
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.difficulty
  end
end
