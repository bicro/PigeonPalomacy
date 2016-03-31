Given /^the following admins exist/ do |admin_table|
  admin_table.hashes.each do |admin|
    AdminUser.create!(admin)
  end 
end

Given /^I am logged in and on the admin page$/ do
    steps %{
     Given I am on the admin login page
     When I fill in "Email" with "admin2@example.com"
     And I fill in "Password" with "password"
     And I press "Login"
     Then I should be on the admin page
    }
end

Given /^I delete the first question$/ do 
#  Capybara.javascript_driver = :selenium
  first(:link, "Delete").click
  #alert = page.driver.browser.switch_to.alert
  #alert.accept
  page.evaluate_script('window.confirm = function() { return true; }')
end