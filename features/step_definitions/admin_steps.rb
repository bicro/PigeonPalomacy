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

Given /^I fill in the last "(.*?)" with "(.*?)"$/ do  |field, fill|
  all(:field, field).last.set(fill)
end