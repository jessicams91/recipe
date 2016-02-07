class RemoveKitchensFromRecipes < ActiveRecord::Migration
  def change
    remove_reference :recipes, :kitchens, index: true, foreign_key: true
  end
end
