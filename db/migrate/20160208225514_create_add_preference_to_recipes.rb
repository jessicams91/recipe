class CreateAddPreferenceToRecipes < ActiveRecord::Migration
  def change
    create_table :add_preference_to_recipes do |t|
      t.references :preference, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
