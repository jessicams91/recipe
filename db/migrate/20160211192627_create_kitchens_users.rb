class CreateKitchensUsers < ActiveRecord::Migration
  def change
    create_table :kitchens_users do |t|
      t.references :kitchen, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
