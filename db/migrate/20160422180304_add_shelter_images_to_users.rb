class AddShelterImagesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shelter_image_1, :string
    add_column :users, :shelter_image_2, :string
  end
end
