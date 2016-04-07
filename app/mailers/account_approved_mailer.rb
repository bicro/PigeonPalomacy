class AccountApprovedMailer < ApplicationMailer
    default from: 'pigeonpalomacy@gmail.com'
    
    def account_approved_email(user)
        @user = user
        @url = "https://safe-brushlands-47142.herokuapp.com/users/sign_in"
        mail(to: @user.email, subject: "Your PigeonPalomacy account is approved")
    end
end
