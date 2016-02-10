class CreateFavoriteRecipes < ActiveRecord::Migration
  def change
    create_table :favorite_recipes do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
