class AddKitchensToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :kitchens, index: true, foreign_key: true
  end
end
