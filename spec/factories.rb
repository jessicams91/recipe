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
  end
  factory :preference do
    name 'Carnes'
  end
  factory :food_type do
    name 'Principal'
  end
  factory :kitchen do
    name 'Brasileira'
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
