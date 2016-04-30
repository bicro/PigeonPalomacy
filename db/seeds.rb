# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.create({content: "Is it hanging around persistently 
                            and seems to be asking for help?"}).add_answers([{content: "Yes", expert_score: 1}, 
                                                                            {content: "No", expert_score: 0},
                                                                            {content: "Unknown", expert_score: 0.5}])
                                                                            
Question.create({content: "Can it fly?"}).add_answers([{content: "Yes", expert_score: 0}, 
                                                        {content: "No", expert_score: 1},
                                                        {content: "Unknown", expert_score: 0.5}])

Question.create({content: "Is it injured or weak?"}).add_answers([{content: "Yes", expert_score: 1},
                                                        {content: "No", expert_score: 0},
                                                        {content: "Unknown", expert_score: 0.5}])

Question.create({content: "Is the bird white?"}).add_answers([{content: "Yes", expert_score: 1, answer_image: File.open("#{Rails.root}/db/seed_images/king_pigeon.jpg")}, 
                                                                {content: "No", expert_score: 0, answer_image: File.open("#{Rails.root}/db/seed_images/regular_pigeon.jpg")},
                                                                {content: "Unknown", expert_score: 0.5}])

Question.create({content: "Does it have a leg band?"}).add_answers([{content: "Yes", expert_score: 1}, 
                                                                         {content:"No", expert_score: 0},
                                                                         {content: "Unknown", expert_score: 0.5}])
                       
if Rails.env == "development"
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end