require 'spec_helper'
require 'rails_helper'
include Devise::TestHelpers

describe Admin::SettingsController, type: :controller do
    
  render_views
  
  let(:admin_user) { AdminUser.create!(email: 'admin12@example.com', password: 'password')}

  before(:each) do
    sign_in admin_user
  end
    
  describe "GET edit" do
    it "edits hurt threshold in settings" do
      hurt_threshold = Setting.where(:var => "Hurt Threshold").first
      get :edit, :id => hurt_threshold.id
      expect(assigns(:setting)).to eq(hurt_threshold)
    end
  end
  
  describe "GET index" do
    it "displays hurt threshold" do
      hurt_threshold = Setting.where(:var => "Hurt Threshold").first
      get :index
      expect(assigns(:settings)).to include(hurt_threshold)
    end
  end

    

end