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

permit_params :approved
scope :all
scope("Not Approved", :default => true) { |scope| scope.where(approved: false) }

index do
    column "Name" do |user|
        link_to user.name, edit_admin_user_path(user)
    end
    column :approved
    column :phone
    column :email
    column :address
    column "Approve User" do |user|
        link_to "Approve", approve_admin_user_path(user.id), method: :put
    end
end

member_action :approve, method: :put do
    resource.update_attributes! :approved => true
    redirect_to resources_path, notice: "User Approved!"
end

end