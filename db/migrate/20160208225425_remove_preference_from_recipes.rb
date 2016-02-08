class RemovePreferenceFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :preference, :string
  end
end
