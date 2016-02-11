class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :city, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_reference :users, :preference, index: true, foreign_key: true
  end
end
