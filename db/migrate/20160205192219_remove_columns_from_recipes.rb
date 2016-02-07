class RemoveColumnsFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :kitchen, :string
    remove_column :recipes, :food_type, :string
    remove_column :recipes, :preference, :string
    remove_column :recipes, :photo, :string
  end
end
