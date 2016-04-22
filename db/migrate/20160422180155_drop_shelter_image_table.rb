class DropShelterImageTable < ActiveRecord::Migration
  def change
    drop_table :shelter_images
  end
end
