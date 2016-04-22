Feature: During signup, a prospective expert can upload shelter images in signup form (Sad Paths)

Scenario: As a pigeon expert I want to upload shelter images in signup form as part of the application
 Given I am on the signup page
 When I enter the following information to sign up:
 | email                    | name         | phone      | address             | password            | street_address_1 | street_address_2 | city     | state | zipcode | preferred_contact | expertise_description    | country |
 | robert@berkeley.edu      | Robert Lin   | 5105410000 | #12 2715 Dwight Way | robert0000          |  2715 Dwight Way |  #22             | Berkeley |   CA  |  94704  |  phone            |  I helped pigeons before |  US     |
 And I upload the last "Shelter Image 1" with "pigeon.pdf"
 When I press "Submit"
 Then I should be on the users page
 And I should see "allowed types: jpg, jpeg, gif, png"