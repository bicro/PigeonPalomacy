Feature: Joining the organization
  
Background: users in database

  Given the following users exist:
  | email                    | name         | phone      | password    | approved | street_address_1 | street_address_2 | city     | state | zipcode | preferred_contact | expertise_description    | country |
  | linfeng@berkeley.edu     | Feng Lin     | 5105415041 | linfeng0000 | true     | "2715 Dwight Way"| "#22"            |"Berkeley"| "CA"  | "94704" | "phone"           | "I helped pigeons before"| "US"    |

Scenario: As a pigeon expert I want to join the pigeon palomacy rescue effort so that I can save the lives of helpless pigeons
 Given I am on the signup page
 When I enter the following information to sign up:
 | email                    | name         | phone      | address             | password            | street_address_1 | street_address_2 | city     | state | zipcode | preferred_contact | expertise_description    | country |
 | robert@berkeley.edu      | Robert Lin   | 5105410000 | #12 2715 Dwight Way | robert0000          | "2715 Dwight Way"| "#22"            |"Berkeley"| "CA"  | "94704" | "phone"           | "I helped pigeons before"| "US"    |
 When I press "Submit"
 Then "Robert Lin" should be registered
 Then I should be on the home page
 And I should see "You have signed up successfully but your account has not been approved by your administrator yet."
 
Scenario: As a pigeon expert I want to log in to change my address so that I can conduct pigeon rescue in a different area
 Given I am on the signin page
 When I enter the following information to sign in:
 | email                     |  password    |
 | linfeng@berkeley.edu      |  linfeng0000 |
 When I press "Log In"
 Then I should be on the home page
 When I am on the edit page
 When I fill in "Email" with "linfeng@gmail.com"
 When I fill in "Current password" with "linfeng0000"
 Then I press "Update"
 Then email of "Feng Lin" should be "linfeng@gmail.com"