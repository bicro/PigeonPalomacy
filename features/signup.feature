Feature: Joining the organization
  
Background: users in database

  Given the following users exist:
  | email                    | name         | phone      | address             | password    | approved |
  | linfeng@berkeley.edu     | Feng Lin     | 5105415041 | #22 2715 Dwight Way | linfeng0000 | true     |

Scenario: As a pigeon expert I want to join the pigeon palomacy rescue effort so that I can save the lives of helpless pigeons
 Given I am on the signup page
 When I enter the following information to sign up:
 | email                    | name         | phone      | address             | password    |
 | robert@berkeley.edu      | Robert Lin   | 5105410000 | #12 2715 Dwight Way | robert0000  |
 When I press "Submit"
 Then "Robert Lin" should be registered
 Then I should be on the home page
 
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

 Scenario: As a pigeon expert, I can include experience description, preferred contact method and upload my shelter images in my application
 Given I am on the signup page
 When I enter the following information to sign up:
 | email                    | name         | phone      | address             | password    | experience |  preferred contact method
 | robert@berkeley.edu      | Robert Lin   | 5105410000 | #12 2715 Dwight Way | robert0000  | Worked in a pigeon shelter | phone
Then I upload shelter images
 When I press "Submit"
 Then the application for "Robert Lin" should be registered
 Then I should be on the home page
