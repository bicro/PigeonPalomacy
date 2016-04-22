class CreateShelterImage < ActiveRecord::Migration
  def change
    create_table :shelter_images do |t|
      t.belongs_to :user
      t.string :shelter_image
    end
  end
end
