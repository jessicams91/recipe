FactoryGirl.define do
  factory :recipe do
    name 'Feijoada'
    kitchen
    food_type 'Principal'
    preference 'Carnes'
    servings 6
    cook_time 30
    difficulty 'Media'
    step_by_step 'Cortar tudo'
    ingredients 'Feijão e etc'
  end
  factory :kitchen do
    name 'Brasileira'
  end
end
