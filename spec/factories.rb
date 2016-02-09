FactoryGirl.define do
  factory :admin do
    email 'jessica_admin@mail.com.br'
    password '12345678'
  end
  factory :user do
    email 'jessica@mail.com.br'
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
    name 'Feijoada'
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
