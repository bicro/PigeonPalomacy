class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stree_address_1, :string
    add_column :users, :stree_address_2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :string
    add_column :users, :country, :string
    add_column :users, :preferred_contact, :string
    add_column :users, :expertise_description, :string
  end
end
