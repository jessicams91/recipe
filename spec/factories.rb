FactoryGirl.define do
  factory :favorite_recipe do
    recipe
    user
  end
  factory :admin do
    sequence(:email) { |n| "user#{n}@email.com" }
    password '12345678'
  end
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    password '12345678'
    sequence(:name) { |n| "Usuário#{n}" }
    city 'São Paulo'
    sequence(:facebook) { |n| "facebook#{n}" }
    sequence(:twitter) { |n| "twitter#{n}" }
  end
  factory :preference do
    sequence(:name, 1) { |n| "Preferência#{n}" }
  end
  factory :food_type do
    sequence(:name, 1) { |n| "Tipo de Comida#{n}" }
  end
  factory :kitchen do
    sequence(:name, 0) {|n| "Cozinha#{n}" }
  end
  factory :recipe do
    sequence(:name, 1) { |n| "Receita#{n}" }
    kitchen
    food_type
    preference
    servings 6
    cook_time 30
    difficulty 'Media'
    step_by_step 'Cortar tudo'
    ingredients 'Feijão e etc'
    user
  end
end
