Feature: We need to infer and cache the coordinates (longitude and latitude) from user signup form. It is needed for providing nearest pigeon rescue experts after a submission (Sad Paths)

Scenario: As a pigeon expert applicant I cannot sign up using a junk address
  Given I am on the signup page
  When I enter the following information to sign up:
    | email                    | name         | phone        | street_address_1 | street_address_2 | city             | state          | zipcode | preferred_contact | expertise_description    | country | password |
    | linfeng2@berkeley.edu      | Robert Lin   | 5105410000 |  2715 Dwight Way |  #22             | aoeudghaoudgaeou |  eaoudhaeoud   |  94704  |  phone            |  I helped pigeons before |  oaehduoaedhoua | password |
  When I press "Submit"
  Then I should be on the users page
  Then I should see "Invalid address"
  
