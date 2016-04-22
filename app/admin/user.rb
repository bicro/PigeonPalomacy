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

show do
    attributes_table do
        row :name
        row :approved
        row :phone
        row :email
        row "Address Line 1" do 
            user.street_address_1
        end
        row "Address Line 2" do 
            user.street_address_2
        end
        row :city
        row :state
        row :zipcode
        row :country
        row "Computer Inferred Address" do
            user.inferred_address
        end
        row "Preferred Contact" do
            user.preferred_contact
        end
        row "Expertise Description" do
            user.expertise_description
        end
        row "Shelter Image 1" do
            image_tag user.shelter_image_1.url
        end
        row "Shelter Image 2" do
            image_tag user.shelter_image_2.url
        end
    end
  end

index do
    column :name
    column :approved
    column :phone
    column :email
    column :city
    column :state
    column :country
    column "Expertise Description", :expertise_description
    column "Approve User" do |user|   
        if user.approved?
            span "Already Approved"
        else
            link_to "Approve", approve_admin_user_path(user.id), method: :put
        end
    end
    actions
end

action_item :view, only: :show do
    if user.approved?
        span "Already Approved"
    else
        link_to "Approve", approve_admin_user_path(user.id), method: :put
    end
end

member_action :approve, method: :put do
    resource.update_attributes! :approved => true
    resource.send_account_approved_email
    redirect_to admin_users_path(:scope=>"not_approved"), notice: "User Approved!"
end

end