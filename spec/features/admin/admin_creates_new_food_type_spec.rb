require  'rails_helper'

describe 'Administrator creates a new food_type' do
  scenario 'successfully' do
    food_type = FactoryGirl.create(:food_type)

    visit new_food_type_path

    fill_in 'Name',         with: food_type.name

    click_on 'Criar Tipo de Comida'

    expect(page).to have_content food_type.name
  end
end
