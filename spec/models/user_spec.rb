require 'spec_helper'

describe User do
  
    before(:all) do 
      Geocoder.configure(:lookup => :test)
    
      Geocoder::Lookup::Test.add_stub(
        "2715 Dwight Way,#22,Berkeley,CA,94704,US", [
          {
            'latitude'     => 40.714353,
            'longitude'    => -74.005973,
            'formatted_address' => '2715 Dwight Way,#22,Berkeley,CA,94704,USA',
            'state'        => 'California',
            'state_code'   => 'CA',
            'country'      => 'United States',
            'country_code' => 'US'
          }
         ]
        )
    end
  
    before(:all) do
      @user = User.create!({email: "test@berkeley.edu", name: "tom lin", phone: "5105415041", password: "password", street_address_1: "2715 Dwight Way", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94704", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
    end
    
    after(:all) do
      @user.delete
    end
  
    it "should have name" do
       @user.name.should eq("tom lin")
    end
    
    it "should be not approved" do
       @user.approved?.should be false
    end
    
    it "should infer the correct coordinates" do
      @user.latitude.should eq(40.714353)
      @user.longitude.should eq(-74.005973)
    end
    
    it "should populate the correct inferred_address" do
      @user.inferred_address.should eq('2715 Dwight Way,#22,Berkeley,CA,94704,USA')
    end
    
    describe "#active_for_authentication?" do
        it "should be inactive for authentication by default" do
            @user.active_for_authentication?.should be false
        end
    end
    
    describe "#inactive_message" do
        it "should show not_approved message if user is not approved" do
            @user.inactive_message.should be (:not_approved)
        end
        it "should show the usual inactive message if user is approved" do
            @user.approved = true
            @user.inactive_message.should be (:inactive)
        end
    end
    
    describe "#send_account_approved_email" do
        it 'sends account approved email' do
            expect {@user.send_account_approved_email}.to change {ActionMailer::Base.deliveries.count}.by(1)
        end
    end
end