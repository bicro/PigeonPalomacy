# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.create({content: "Is it hanging around persistently 
                            and seems to be asking for help?"}).add_answers([{content: "Yes", expert_score: 1}, 
                                                                            {content: "No", expert_score: 0}])
                                                                            
Question.create({content: "Can it fly?"}).add_answers([{content: "Yes", expert_score: 0}, 
                                                        {content: "No", expert_score: 1}])

Question.create({content: "Is it injured"}).add_answers([{content: "Yes", expert_score: 1},
                                                        {content: "No", expert_score: 0}])

Question.create({content: "Is it a King Pigeon?"}).add_answers([{content: "Yes", expert_score: 1, answer_image: File.open("#{Rails.root}/db/seed_images/king_pigeon.jpg")}, 
                                                                {content: "No", expert_score: 0, answer_image: File.open("#{Rails.root}/db/seed_images/regular_pigeon.jpg")}])

Question.create({content: "Does it have a numbered band."}).add_answers([{content: "Yes", expert_score: 1}, 
                                                                         {content:"No", expert_score: 0}])
                                                                         
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

User.create!({email: "NY@berkeley.edu", name: "bernie trump", phone: "5105415041", password: "password", street_address_1: "80 Delancey St", street_address_2: "#22", city: "New York", state: "NY", zipcode: "10002", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US", approved: true}) 
User.create!({email: "CAtom12314@berkeley.edu", name: "tom lin", phone: "5105415041", password: "password", street_address_1: "2715 Dwight Way", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94704", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US", approved: true}) 
User.create!({email: "CAtrump345@berkeley.edu", name: "random name", phone: "5105415041", password: "password", street_address_1: "1773 Oxford St", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94709", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US", approved: true}) 
User.create!({email: "CAbernie345@berkeley.edu", name: "bernie trump", phone: "5105415041", password: "password", street_address_1: "2128 Oxford St", street_address_2: "#22", city: "Berkeley", state: "CA", zipcode: "94709", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US", approved: true}) 
User.create!({email: "CAobama@berkeley.edu", name: "tom lin", phone: "5105415041", password: "password", street_address_1: "420 W Grand Ave, Oakland", street_address_2: "#22", city: "Oakland", state: "CA", zipcode: "94612", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US", approved: true}) 
User.create!({email: "CAclinton@berkeley.edu", name: "random name", phone: "5105415041", password: "password", street_address_1: "5767 Christie Ave", street_address_2: "#22", city: "Emeryville", state: "CA", zipcode: "94608", preferred_contact: "phone", expertise_description: "I helped pigeons before", country: "US", approved: true}) 
