require 'spec_helper'

describe Submission do 
    before do 
        @submission = Submission.create
        @answer = Answer.create({content: "Yes", expert_score: 1.0})
        @submission.add_answer @answer.id  
        @submission.longitude = -122.266247
        @submission.latitude = 37.875577

        @submission.stub(:distance_to).and_return(100)

        @submission.save

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

        Geocoder::Lookup::Test.add_stub(
            "1773 Oxford St,#22,Berkeley,CA,94709,US", [
              {
                'latitude'     => 37.875577,
                'longitude'    => -122.266247,
                'formatted_address' => '1773 Oxford St,#22,Berkeley,CA,94709,USA',
                'state'        => 'California',
                'state_code'   => 'CA',
                'country'      => 'United States',
                'country_code' => 'US'
              }
            ]
        ) 

        Geocoder::Lookup::Test.add_stub(
            "2128 Oxford St,#22,Berkeley,CA,94709,US", [
              {
                'latitude'     => 37.870347,
                'longitude'    => -122.266140,
                'formatted_address' => '2128 Oxford St,#22,Berkeley,CA,94709,USA',
                'state'        => 'California',
                'state_code'   => 'CA',
                'country'      => 'United States',
                'country_code' => 'US'
              }
            ]
        )    
        
        Geocoder::Lookup::Test.add_stub(
            "80 Delancey St,#22,New York,NY,10002,US", [
              {
                'latitude'     => 40.719354,
                'longitude'    => -73.989860,
                'formatted_address' => '80 Delancey St,#22,New York,NY,10002,US',
                'state'        => 'New York',
                'state_code'   => 'NY',
                'country'      => 'United States',
                'country_code' => 'US'
              }
            ]
        )   

    end
    
   it 'should say an expert is needed' do
        @submission.need_expert?.should be true
   end

    it 'should add an answer to this submission' do
        answer2 = Answer.create({content: "Yes", expert_score: 1.0})
        @submission.add_answer answer2.id
        @submission.answers.include? Answer.find(answer2.id)
    end

    it 'sad path: should not find the closest expert when none exist' do 
        expect(@submission.experts.count).to be 0
    end

    it 'should find the closest experts when more than 3 exist' do
        exp1 = User.create!({email: "tom@berkeley.edu", name: "tom lin", phone: "5105415041", password: "password", street_address_1: "2715 Dwight Way", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94704", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        exp2 = User.create!({email: "random@berkeley.edu", name: "random name", phone: "5105415041", password: "password", street_address_1: "1773 Oxford St", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94709", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        exp3 = User.create!({email: "bernie@berkeley.edu", name: "bernie trump", phone: "5105415041", password: "password", street_address_1: "2128 Oxford St", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94709", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        exp4 = User.create!({email: "cruz@berkeley.edu", name: "bernie trump", phone: "5105415041", password: "password", street_address_1: "80 Delancey St", street_address_2: "#22", city: "New York", state: "NY", zipcode: "10002", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        
        expect(@submission.experts.count == 3).to be true
        
        @submission.experts.each do |expert|
            expect(expert.email != "cruz@berkeley.edu"). to be true
        end
    end

    it 'should not find the expert in New York when the submission is in California' do
        exp1 = User.create!({email: "tom@berkeley.edu", name: "tom lin", phone: "5105415041", password: "password", street_address_1: "2715 Dwight Way", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94704", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        exp2 = User.create!({email: "random@berkeley.edu", name: "random name", phone: "5105415041", password: "password", street_address_1: "1773 Oxford St", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94709", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        exp3 = User.create!({email: "bernie@berkeley.edu", name: "bernie trump", phone: "5105415041", password: "password", street_address_1: "2128 Oxford St", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94709", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        exp4 = User.create!({email: "cruz@berkeley.edu", name: "bernie trump", phone: "5105415041", password: "password", street_address_1: "80 Delancey St", street_address_2: "#22", city: "New York", state: "NY", zipcode: "10002", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        
        expect(@submission.experts.count == 3).to be true
        
        @submission.experts.each do |expert|
            expect(expert.email != "cruz@berkeley.edu"). to be true
        end
    end
    
 end