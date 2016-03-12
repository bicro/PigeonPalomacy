class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :phone, :address, :password, :password_confirmation)
  end
end
