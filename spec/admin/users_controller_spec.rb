require 'spec_helper'
require 'rails_helper'
include Devise::TestHelpers

describe Admin::UsersController, type: :controller do
  render_views
  
  let(:admin_user) { AdminUser.create!(email: 'admin12@example.com', password: 'password')}

  before(:all) do 
    Geocoder.configure(:lookup => :test)
  
    Geocoder::Lookup::Test.add_stub(
      "2715 Dwight Way,#22,Berkeley,CA,94704,US", [
        {
          'latitude'     => 40.7143528,
          'longitude'    => -74.0059731,
          'formatted_address' => '2715 Dwight Way,#22,Berkeley,CA,94704,USA',
          'state'        => 'California',
          'state_code'   => 'CA',
          'country'      => 'United States',
          'country_code' => 'US'
        }
       ]
      )
  end

  before(:each) do
    sign_in admin_user
  end
  
  describe "GET index" do
    it "displays unapproved users" do
      a_user = User.create!({email: "test@berkeley.edu", name: "tom lin", phone: "5105415041", password: "password", street_address_1: "2715 Dwight Way", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94704", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
      get :index
      expect(assigns(:users)).to eq([a_user])
    end
    
    it "displays approved users" do
      a_user = User.create({email: "test15@berkeley.edu", name: "philip lin", phone: "5105415041", password: "password", approved: true, street_address_1: "2715 Dwight Way", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94704", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
      get :index, :scope => "all"
      expect(assigns(:users)).to include(a_user)
    end
  end
  
  describe "PUT approve" do
    it "approves users" do
      a_user = User.create({email: "test@berkeley.edu", name: "tom lin", phone: "5105415041", password: "password", street_address_1: "2715 Dwight Way", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94704", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
      put :approve, :id => a_user.id
      expect ActionMailer::Base.deliveries.count == 1
      expect(response).to redirect_to(:action => :index, :scope => "not_approved")
    end
  end
end