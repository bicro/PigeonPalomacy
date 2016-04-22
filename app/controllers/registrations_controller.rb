class RegistrationsController < Devise::RegistrationsController
  
  private

  def sign_up_params

    params.require(:user).permit(
      :name, 
      :email, 
      :phone, 
      :password, 
      :password_confirmation, 
      :street_address_1, 
      :street_address_2, 
      :city, 
      :state, 
      :zipcode, 
      :country, 
      :preferred_contact, 
      :expertise_description, 
      shelter_images_attributes: [:id, :user_id, :shelter_image]
    )
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :current_password, :street_address_1, :street_address_2, :city, :state, :zipcode, :country, :preferred_contact, :expertise_description)
  end
end