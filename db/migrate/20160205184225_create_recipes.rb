class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :kitchen
      t.string :food_type
      t.string :preference
      t.string :servings
      t.string :cook_time
      t.string :difficulty
      t.string :step_by_step
      t.string :photo

      t.timestamps null: false
    end
  end
end
