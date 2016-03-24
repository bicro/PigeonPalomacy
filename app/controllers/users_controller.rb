class UsersController < ApplicationController
    
    before_filter :authenticate_admin_user!, :only => :approve_user
    
    def approve_user
        user = User.find(params[:id])
        user.approve_user!
        render :nil => true
    end
end