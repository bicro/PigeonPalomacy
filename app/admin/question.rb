ActiveAdmin.register Question do

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
permit_params :content, :subcontent, answers_attributes: [:id, :question_id, :answer_image, :expert_score, :content]

index do
    column :content
    column :subcontent
    actions
end

show do
    attributes_table do
        row :content
        row :subcontent
    end
    panel "Answers" do
        table_for question.answers do
            column :content
            column :expert_score
            column :img_url
        end
    end
end

form(:html => { :multipart => true }) do |f|
    f.semantic_errors
    f.inputs 'Question Details' do
        f.input :content
        f.input :subcontent
    end
    f.inputs "Answers" do
        f.has_many :answers, new_record: 'Add Answer' do |b|
            b.input :content
            b.input :expert_score
            b.input :answer_image, as: :file
        end
    end
    f.actions
end


end
