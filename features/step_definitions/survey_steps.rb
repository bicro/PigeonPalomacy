Given /^the following questions exist:$/ do |questions_table|
  Question.delete_all
  questions_table.hashes.each do |question|
    Question.create(question)
  end
end

Given /^the following answers exist:$/ do |answers_table|
  Answer.delete_all
  answers_table.hashes.each do |answer|
    Answer.create(answer)
  end
end

When(/^I mark the answers for an injured pigeon$/) do
  choose("1_1")
  choose("2_4")
  choose("3_5")
  choose("4_7")
  choose("5_9")
end

When(/^I mark the answers for an uninjured pigeon$/) do
  choose("1_2")
  choose("2_3")
  choose("3_6")
  choose("4_8")
  choose("5_10")
end


When(/^I mark the first answer$/) do
  choose("1_2")
end

Then(/^I should see an iframe with source "([^\"]*)"$/) do |src|
  find("iframe")[:src].should include(src)
end