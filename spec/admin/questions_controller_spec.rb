require 'spec_helper'
require 'rails_helper'
include Devise::TestHelpers

describe Admin::QuestionsController, type: :controller do
    
  render_views
  
  let(:admin_user) { AdminUser.create!(email: 'admin12@example.com', password: 'password')}

  before(:each) do
    sign_in admin_user
  end
    
  describe "GET index" do
    it "displays questions" do
      a_question = Question.create({content: "Can it swim?"}) 
      get :index
      expect(assigns(:questions)).to eq([a_question])
    end
  end
    

end