class AddFavoriteCountToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :favorite_count, :integer, :default => 0
  end
end
