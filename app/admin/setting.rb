ActiveAdmin.register Setting do

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

actions :index, :update, :edit

permit_params :var, :value, :thing_id, :thing_type

member_action :update, method: :put do
    Setting[params[:setting][:var]] = Float(params[:setting][:value])
    redirect_to admin_settings_path, :notice => "#{params[:value]} added"
end

index do
    column :var
    column :value
    actions
end

form do |f|
    f.semantic_errors
    f.inputs 'Settings' do
        f.input :var
        f.input :value
    end
    f.actions
end


end
