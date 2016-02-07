class RemoveServingsFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :servings, :string
  end
end
