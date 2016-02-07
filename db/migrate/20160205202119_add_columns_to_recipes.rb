class AddColumnsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :kitchen, :string
    add_column :recipes, :food_type, :string
    add_column :recipes, :preference, :string
  end
end
