class ChangeColumnNamesInUsers < ActiveRecord::Migration
  def change
    remove_column :users, :stree_address_1
    remove_column :users, :stree_address_2
    add_column :users, :street_address_1, :string
    add_column :users, :street_address_2, :string
  end
end
