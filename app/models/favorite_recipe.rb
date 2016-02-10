class FavoriteRecipe < ActiveRecord::Base
  belongs_to :recipe, counter_cache: :favorite_count
  belongs_to :user
end
