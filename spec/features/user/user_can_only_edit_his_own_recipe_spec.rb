require 'rails_helper'

describe 'user can edit recipes he created' do
  scenario 'successfully' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    recipe = FactoryGirl.create(:recipe, user: user)

    visit edit_recipe_path(recipe)

    fill_in 'Name', with: 'Receita 1'
    click_on 'Atualizar Receita'

    expect(page).to have_content 'Receita 1'
    expect(page).to have_content recipe.kitchen.name
    expect(page).to have_content recipe.food_type.name
    expect(page).to have_content recipe.preference.name
    expect(page).to have_content recipe.servings
    expect(page).to have_content recipe.cook_time
    expect(page).to have_content recipe.step_by_step
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.difficulty
  end

  scenario "and not other user's" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, email: 'maria@mail.com.br')
    recipe = FactoryGirl.create(:recipe, user: user)
    login_as(user2, scope: :user)

    visit edit_recipe_path(recipe)

    expect(page).to have_content 'Social Recipes'
  end
end
