require 'spec_helper'
require 'rails_helper'
include Devise::TestHelpers

describe Admin::AdminUsersController, type: :controller do
    
  render_views
  
  let(:admin_user) { AdminUser.create!(email: 'admin12@example.com', password: 'password')}

  before(:each) do
    sign_in admin_user
  end
  
  describe "GET index" do
    it "displays admin users" do
      get :index
      expect(assigns(:admin_users)).to include(admin_user)
    end
  end

  describe 'GET edit' do
    it 'renders user form' do
      get :edit, id: admin_user.to_param
      expect(assigns(:admin_user)).to eq admin_user
    end
  end
  
  describe 'PATCH update' do
    it 'updates user' do
      patch :update, { id: admin_user.to_param, admin_user: { email: 'admin50@example.com' }}
      admin_user.reload
      expect(admin_user.email).to eq 'admin50@example.com'
    end
  end
end