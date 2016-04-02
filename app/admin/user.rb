ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

actions :all, :except => [:edit, :create, :new]

permit_params :approved
scope :all
scope("Not Approved", :default => true) { |scope| scope.where(approved: false) }

index do
    column :name
    column :approved
    column :phone
    column :email
    column :address
    column "Approve User" do |user|
        if user.approved?
            span "Already Approved"
        else
            link_to "Approve", approve_admin_user_path(user.id), method: :put
        end
    end
    column "Delete User" do |user|
        link_to "Delete User", admin_user_path(user.id), method: :delete
    end
end

member_action :approve, method: :put do
    resource.update_attributes! :approved => true
    redirect_to admin_users_path(:scope=>"not_approved"), notice: "User Approved!"
end

end