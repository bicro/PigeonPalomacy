require 'spec_helper'
require 'rails_helper'
include Devise::TestHelpers

describe Admin::DashboardController, type: :controller do
    
  render_views
  
  let(:admin_user) { AdminUser.create!(email: 'admin12@example.com', password: 'password')}

  before(:each) do
    sign_in admin_user
  end
    
  describe "GET index" do
    it "displays dashboard messages" do
      get :index
    end
  end

end