class AddCookTimeToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :cook_time, :time
  end
end
