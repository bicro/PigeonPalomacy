Feature: Joining the organization (Sad Paths)
  
Background: users in database

  Given the following users exist:
  | email                    | name         | phone      | password    | approved | street_address_1 | street_address_2 | city     | state | zipcode | preferred_contact | expertise_description    | country |
  | linfeng@berkeley.edu     | Feng Lin     | 5105415041 | linfeng0000 | true     |  2715 Dwight Way |  #22             | Berkeley |  CA   |  94704  |  phone            | I helped pigeons before| US    |

Scenario: As a pigeon expert applicant I cannot have a password with fewer than 8 characters
  Given I am on the signup page
  When I enter the following information to sign up:
    | email                    | name         | phone      | password    | street_address_1 | street_address_2 | city     | state | zipcode | preferred_contact | expertise_description    | country |
    | robert@berkeley.edu      | Robert Lin   | 5105410000 | 000         | 2715 Dwight Way| #22            |Berkeley| CA  | 94704 | phone           | I helped pigeons before| US    |
  When I press "Submit"
  Then I should be on the users page
  Then I should see "Password is too short (minimum is 8 characters)"

Scenario: As a pigeon expert applicant I cannot sign up using an email used by someone else
  Given I am on the signup page
  When I enter the following information to sign up:
    | email                    | name         | phone       | password   | street_address_1 | street_address_2 | city     | state | zipcode | preferred_contact | expertise_description    | country |
    | linfeng@berkeley.edu      | Robert Lin   | 5105410000 | password  |  2715 Dwight Way |  #22             | Berkeley |  CA   |  94704  |  phone            |  I helped pigeons before |  US     |
  When I press "Submit"
  Then I should be on the users page
  Then I should see "Email has already been taken"

Scenario: As a pigeon expert applicant I cannot sign in using a submitted but unapproved account
  Given I am on the signup page
  When I enter the following information to sign up:
    | email                    | name         | phone        | password    | street_address_1 | street_address_2 | city     | state | zipcode | preferred_contact | expertise_description    | country |
    | linfeng2@berkeley.edu    | Robert Lin   | 5105410000   | password    |  2715 Dwight Way |  #22             | Berkeley |  CA   |  94704  |  phone            |  I helped pigeons before |  US     |
  When I press "Submit"
  Then I should see "You have signed up successfully but your account has not been approved by your administrator yet."
  When I am on the signin page
  Then I enter the following information to sign in:
    | email                     |  password    |
    | linfeng2@berkeley.edu      |  password |
  When I press "Log In"
  Then I should see "Your account has not been approved by your administrator yet."

Scenario: As a pigeon expert applicant I cannot sign up if my password and password confirmation do not match
  Given I am on the signup page
  When I enter the following information to sign up:
    | email                    | name         | phone        | street_address_1 | street_address_2 | city     | state | zipcode | preferred_contact | expertise_description    | country |
    | linfeng2@berkeley.edu      | Robert Lin   | 5105410000 |  2715 Dwight Way |  #22             | Berkeley |  CA   |  94704  |  phone            |  I helped pigeons before |  US     |
  Then I fill in "Password" with "password"
  Then I fill in "Password confirmation" with "password2"
  When I press "Submit"
  Then I should be on the users page
  Then I should see "Password confirmation doesn't match Password"