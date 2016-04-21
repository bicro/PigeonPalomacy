require 'spec_helper'

describe Submission do 
    before do 
        @submission = Submission.create
        @answer = Answer.create({content: "Yes", expert_score: 1.0})
        @submission.add_answer @answer.id  

        Geocoder.configure(:lookup => :test)

        Geocoder::Lookup::Test.stub(:distance_to).with(lat_long) {
            return (self.latitude - lat_long[0])**2  + (self.long - lat_long[1])**2
        }

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
    end
    
   it 'should say an expert is needed' do
        @submission.need_expert?.should be true
   end
    
    it 'should find the closest expert' do
        # TODO!
    end
    
    it 'should add an answer to this submission' do
        answer2 = Answer.create({content: "Yes", expert_score: 1.0})
        @submission.add_answer answer2.id
        @submission.answers.include? Answer.find(answer2.id)
    end

    it 'should find the closest experts when less than 5 exist' do 
        exp1 = User.create!({email: "tom@berkeley.edu", name: "tom lin", phone: "5105415041", password: "password", street_address_1: "2715 Dwight Way", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94704", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        exp2 = User.create!({email: "random@berkeley.edu", name: "random name", phone: "5105415041", password: "password", street_address_1: "1773 Oxford St", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94709", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        exp2 = User.create!({email: "bernie@berkeley.edu", name: "bernie trump", phone: "5105415041", password: "password", street_address_1: "2128 Oxford St", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94709", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 

        #puts @submission.experts.count
        expect(@submission.experts.count == 3).to be true
    end

    it 'should find the closest experts when more than 5 exist' do
        exp1 = User.create!({email: "tom@berkeley.edu", name: "tom lin", phone: "5105415041", password: "password", street_address_1: "2715 Dwight Way", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94704", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        exp2 = User.create!({email: "random@berkeley.edu", name: "random name", phone: "5105415041", password: "password", street_address_1: "1773 Oxford St", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94709", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        exp2 = User.create!({email: "bernie@berkeley.edu", name: "bernie trump", phone: "5105415041", password: "password", street_address_1: "2128 Oxford St", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94709", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        #exp1 = User.create!({email: "trump@berkeley.edu", name: "tom lin", phone: "5105415041", password: "password", street_address_1: "420 W Grand Ave, Oakland", street_address_2: "#22", city: "Oakland", state: "CA", zipcode: "94612", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        #exp2 = User.create!({email: "clinton@berkeley.edu", name: "random name", phone: "5105415041", password: "password", street_address_1: "5767 Christie Ave", street_address_2: "#22", city: "Emeryville", state: "CA", zipcode: "94608", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
        #exp2 = User.create!({email: "cruz@berkeley.edu", name: "bernie trump", phone: "5105415041", password: "password", street_address_1: "80 Delancey St", street_address_2: "#22", city: "New York", state: "NY", zipcode: "10002", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US"}) 
    end

 end