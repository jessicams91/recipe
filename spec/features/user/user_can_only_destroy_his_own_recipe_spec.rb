require 'rails_helper'

describe 'user can destroy recipes he created' do
  scenario 'successfully' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    recipe = FactoryGirl.create(:recipe, user: user)

    visit recipe_path(recipe)
    click_on 'Deletar'

    expect(page).to_not have_content 'Receita 1'
    expect(page).to_not have_content recipe.kitchen.name
    expect(page).to_not have_content recipe.food_type.name
    expect(page).to_not have_content recipe.preference.name
    expect(page).to_not have_content recipe.servings
    expect(page).to_not have_content recipe.cook_time
    expect(page).to_not have_content recipe.step_by_step
    expect(page).to_not have_content recipe.ingredients
    expect(page).to_not have_content recipe.difficulty
  end

  scenario "and not other user's" do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, email: 'maria@mail.com.br')
    recipe = FactoryGirl.create(:recipe, user: user)
    login_as(user2, scope: :user)

    visit recipe_path(recipe)

    expect(page).to_not have_link 'Deletar'
  end
end
