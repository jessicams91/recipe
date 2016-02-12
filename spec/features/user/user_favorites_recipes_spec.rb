require 'rails_helper'

describe 'User opens recipes' do
  scenario 'and adds to favorites' do
    other_user = FactoryGirl.create(:user, email: 'other_user@mail.com')
    login_as(other_user, scope: :user)
    recipe = FactoryGirl.create(:recipe, user: other_user)
    recipe2 = FactoryGirl.create(:recipe)

    visit recipe_path(recipe)
    click_on 'Adicionar aos Favoritos'

    visit recipe_path(recipe2)
    click_on 'Adicionar aos Favoritos'

    expect(other_user.favorites).to include(recipe)
    expect(other_user.favorites).to include(recipe2)
  end

  scenario 'and unfavorites' do
    other_user = FactoryGirl.create(:user, email: 'other_user@mail.com')
    login_as(other_user, scope: :user)
    recipe = FactoryGirl.create(:recipe, user: other_user)
    recipe2 = FactoryGirl.create(:recipe)

    visit recipe_path(recipe)
    click_on 'Adicionar aos Favoritos'

    visit recipe_path(recipe2)
    click_on 'Adicionar aos Favoritos'

    visit recipe_path(recipe)
    click_on 'Remover dos Favoritos'

    expect(other_user.favorites).to_not include(recipe)
    expect(other_user.favorites).to include(recipe2)
  end
end
