class ShelterImage < ActiveRecord::Base
  mount_uploader :shelter_image, ShelterImageUploader
  belongs_to :user
end
