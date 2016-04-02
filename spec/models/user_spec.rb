require 'spec_helper'

describe User do
    before do
        @user = User.create({email: "test@berkeley.edu", name: "tom lin", phone: "5105415041", address: "2715 Dwight Way, Berkeley CA", password: "password"}) 
    end
    
    it "should have name" do
       @user.name.should eq("tom lin")
    end
    
    it "should be not approved" do
       @user.approved?.should be false
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
end