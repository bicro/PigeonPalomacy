Feature: We need to infer and cache the coordinates (longitude and latitude) from user signup form. It is needed for providing nearest pigeon rescue experts after a submission
  
Scenario: As a pigeon expert I sign up for pigeon palomacy, the coordinates of my address are correctly inferred from my sign up form
 Given I am on the signup page
 When I enter the following information to sign up:
 | email                    | name         | phone      | address             | password            | street_address_1 | street_address_2 | city     | state | zipcode | preferred_contact | expertise_description    | country |
 | robert@berkeley.edu      | Robert Lin   | 5105410000 | #12 2715 Dwight Way | robert0000          |  2715 Dwight Way |  #22             | Berkeley |   CA  |  94704  |  phone            |  I helped pigeons before |  US     |
 When I press "Submit"
 Then the prospective user "Robert Lin" should be on latitude "40.714353" and longitude "-74.005973"
