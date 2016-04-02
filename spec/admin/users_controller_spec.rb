require 'spec_helper'
require 'rails_helper'
include Devise::TestHelpers

describe Admin::UsersController, type: :controller do
  render_views
  
  let(:admin_user) { AdminUser.create!(email: 'admin12@example.com', password: 'password')}

  before(:each) do
    sign_in admin_user
  end
  
  describe "GET index" do
    it "displays unapproved users" do
      a_user = User.create({email: "test@berkeley.edu", name: "tom lin", phone: "5105415041", address: "2715 Dwight Way, Berkeley CA", password: "password"}) 
      get :index
      expect(assigns(:users)).to eq([a_user])
    end
    
    it "displays approved users" do
      a_user = User.create({email: "test15@berkeley.edu", name: "philip lin", phone: "5105415041", address: "2715 Dwight Way, Berkeley CA", password: "password", approved: true}) 
      get :index, :scope => "all"
      expect(assigns(:users)).to eq([a_user])
    end
  end
  
  describe "PUT approve" do
    it "approves users" do
      a_user = User.create({email: "test@berkeley.edu", name: "tom lin", phone: "5105415041", address: "2715 Dwight Way, Berkeley CA", password: "password"}) 
      put :approve, :id => "1"
      expect(response).to redirect_to(:action => :index, :scope => "not_approved")
    end
  end
end