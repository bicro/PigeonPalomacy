Feature: Joining the organization
  
Background: users in database

  Given the following users exist:
  | email                    | name         | phone      | address             | password    |
  | linfeng@berkeley.edu     | Feng Lin     | 5105415041 | #22 2715 Dwight Way | linfeng0000 |

Scenario: As a pigeon expert I want to join the pigeon palomacy rescue effort so that I can save the lives of helpless pigeons
 Given I am on the signup page
 When I enter the following information:
 | email                    | name         | phone      | address             | password    |
 | robert@berkeley.edu      | Robert Lin   | 5105410000 | #12 2715 Dwight Way | robert0000  |
 When I press Submit
 Then I should be on the home page

Scenario: As a pigeon expert I want to log in to change my address so that I can conduct pigeon rescue in a different area
 Given I am on the signin page
 When I enter the following information:
 | email                     |  password    |
 | linfeng@berkeley.edu      |  linfeng0000 |
 When I press Sign In
 Then I should be on the home page
