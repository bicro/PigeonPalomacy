Given /^the following admins exist/ do |admin_table|
  admin_table.hashes.each do |admin|
    AdminUser.create!(admin)
  end 
end

Given /^I am logged in and on the admin page$/ do
    steps %{
     Given I am on the admin login page
     When I fill in "Email" with "admin5@example.com"
     And I fill in "Password" with "password"
     And I press "Login"
     Then I should be on the admin page
    }
end

Given /^I delete the first question$/ do 
  first(:link, "Delete").click
  alert = page.driver.browser.switch_to.alert
  alert.accept
end

Given /^I follow the first question$/ do 
  first(:link, "View").click
end

Given /^I follow the hurt threshold$/ do 
  first(:link, "Edit").click
end

When /^I set hurt threshold to be a (.*?) of "(.*?)"$/ do |type, fill|
    if type == "float"
        fill_in("Value", :with => Float(fill))
    else
        fill_in("Value", :with => fill)
    end
end

Given /^I fill in the last "(.*?)" with "(.*?)"$/ do  |field, fill|
  all(:field, field).last.set(fill)
end

Given /^I upload the last "(.*?)" with "(.*?)"$/ do |field, file|
    attach_file(all(:field, field).last["id"], File.join(Rails.root, 'features', 'image_uploads', file))
end