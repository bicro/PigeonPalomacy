# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Question.create({content: "Is it hanging around persistently and seems to be asking for help?"}).add_answers(["Yes", "No"])

Question.create({content: "Can it fly?"}).add_answers(["Yes", "No"])

Question.create({content: "Is it injured"}).add_answers(["Yes", "No"])

Question.create({content: "Is it a King Pigeon?"}).add_answers(["Yes", "No"])

Question.create({content: "Does it have a numbered band."}).add_answers(["Yes", "No"])