class DropCreateAddPreferenceToRecipesTable < ActiveRecord::Migration
  def up
     drop_table :add_preference_to_recipes
   end

   def down
     raise ActiveRecord::IrreversibleMigration
   end
end
