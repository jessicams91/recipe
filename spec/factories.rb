FactoryGirl.define do
  factory :food_type do
    name 'Pincipal'
  end
  factory :recipe do
    name 'Feijoada'
    kitchen
    food_type
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
