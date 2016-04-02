require 'spec_helper'
include Devise::TestHelpers

describe Admin::AdminUsersController, type: :controller do
    let(:admin_user) { AdminUser.create!(email: 'admin2@example.com', password: 'password')}
    
    describe 'edit' do
        it 'renders user form' do
            get :edit, id: admin_user.to_param
            expect(assigns(:admin_user)).to eq admin_user
        end
    end
end