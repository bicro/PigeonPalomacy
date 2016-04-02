Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that user to the database here.
    user["approved"] = user["approved"].to_bool
    User.create!(user)
  end
end

When /^I enter the following information to (.+):$/ do |mode, user_info|
  user = user_info.hashes.first
  if mode == "sign up"
    step "I fill in \"Name\" with \"#{user["name"]}\""
    step "I fill in \"Email\" with \"#{user["email"]}\""
    step "I fill in \"Phone\" with \"#{user["phone"]}\""
    step "I fill in \"Address\" with \"#{user["address"]}\""
    step "I fill in \"Password\" with \"#{user["password"]}\""
    step "I fill in \"Password confirmation\" with \"#{user["password"]}\""
  else
    step "I fill in \"Email\" with \"#{user["email"]}\""
    step "I fill in \"Password\" with \"#{user["password"]}\""
  end
end

Then /^"([^\"]*)" should be registered$/ do |name|
  User.where(:name => name).size.should eq(1)
end

Then /^email of "([^\"]*)" should be "([^\"]*)"$/ do |name, value|
  User.where(:name => name).first.email.should eq(value)
end

