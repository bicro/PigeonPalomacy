Feature: Joining the organization (Sad Paths)
  
Background: users in database

  Given the following users exist:
  | email                    | name         | phone      | address             | password    | approved |
  | linfeng@berkeley.edu     | Feng Lin     | 5105415041 | #22 2715 Dwight Way | linfeng0000 | true     |

Scenario: As a pigeon expert applicant I cannot have a password with fewer than 8 characters
  Given I am on the signup page
  When I enter the following information to sign up:
  | email                    | name         | phone      | address             | password    |
  | robert@berkeley.edu      | Robert Lin   | 5105410000 | #12 2715 Dwight Way | 000  |
  When I press "Submit"
  Then I should be on the users page
  Then I should see "Password is too short (minimum is 8 characters)"

Scenario: As a pigeon expert applicant I cannot sign up using an email used by someone else
  Given I am on the signup page
  When I enter the following information to sign up:
  | email                    | name         | phone      | address             | password    |
  | linfeng@berkeley.edu      | Robert Lin   | 5105410000 | #12 2715 Dwight Way | password  |
  When I press "Submit"
  Then I should be on the users page
  Then I should see "Email has already been taken"

Scenario: As a pigeon expert applicant I cannot sign in using a submitted but unapproved account
  Given I am on the signup page
  When I enter the following information to sign up:
  | email                    | name         | phone      | address             | password    |
  | linfeng2@berkeley.edu      | Robert Lin   | 5105410000 | #12 2715 Dwight Way | password  |
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
  | email                    | name         | phone      | address             |
  | linfeng2@berkeley.edu      | Robert Lin   | 5105410000 | #12 2715 Dwight Way |
  Then I fill in "Password" with "password"
  Then I fill in "Password confirmation" with "password2"
  When I press "Submit"
  Then I should be on the users page
  Then I should see "Password confirmation doesn't match Password"
  
  
