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

  scenario 'and views last 20 recipes' do
    travel_to 1.day.ago do
      FactoryGirl.create(:recipe, name: 'Receita 1')
    end
    travel_to 2.days.ago do
      FactoryGirl.create_list(:recipe, 18, name: 'Receita 2')
    end
    travel_to 3.days.ago do
      FactoryGirl.create(:recipe, name: 'Receita 3')
    end
    travel_to 4.days.ago do
      FactoryGirl.create(:recipe, name: 'Receita 4')
    end

    visit root_path

    expect(page).to have_content 'Receita 1'
    expect(page).to have_content 'Receita 2'
    expect(page).to have_content 'Receita 3'
    expect(page).to_not have_content 'Receita 4'
  end

  scenario 'and views categories' do
    recipe = FactoryGirl.create(:recipe)

    visit root_path

    expect(page).to have_content recipe.name
    expect(page).to have_content 'Cozinhas'
    expect(page).to have_content 'Tipos'
    expect(page).to have_content 'Preferências'
    expect(page).to have_link recipe.kitchen.name
    expect(page).to have_link recipe.food_type.name
    expect(page).to have_link recipe.preference.name
  end
end
