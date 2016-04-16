Feature: Admin should be able to login, see and edit questions
  
Background: 
  Given the following questions exist:
   | content | id |
   | Is it hanging around persistently and seems to be asking for help? | 1 |
   | Can it fly? | 2 |
   | Is it injured? | 3 |
   | Is it a King Pigeon? | 4 |
   | Does it have a numbered band? | 5 |
  And the following answers exist:
   | content | expert_score | question_id | id |
   | Yes | 1 | 1 | 1 |
   | No | 0 | 1 | 2 |
   | Yes | 0 | 2 | 3 |
   | No | 1 | 2 | 4 |
   | Yes | 1 | 3 | 5 |
   | No | 0 | 3 | 6 |
   | Yes | 1 | 4 | 7 |
   | No | 0 | 4 | 8 |
   | Yes | 1 | 5 | 9 |
   | No | 0 | 5 | 10 |
  And the following admins exist:
    | email | password |
    | admin5@example.com | password |
  
Scenario: Admin logs in to account
    Given I am on the admin login page
    When I fill in "Email" with "admin5@example.com"
    And I fill in "Password" with "password"
    And I press "Login"
    Then I should be on the admin page
    
Scenario: Admin sees questions
    Given I am logged in and on the admin page
    And I follow "Questions"
    Then I should see "Can it fly?"
    And I should see "Is it injured?"
    And I should see "Is it a King Pigeon?"

Scenario: Admin adds answer to existing question
    Given I am logged in and on the admin page
    And I follow "Questions"
    And I follow the first question
    And I follow "Edit Question"
    And I follow "Add Answer"
    And I fill in the last "Content*" with "Answer blah blah"
    And I press "Update Question"
    Then I should see "Answer blah blah"

Scenario: Admin adds image urls as answers to existing question
    Given I am logged in and on the admin page
    And I follow "Questions"
    And I follow the first question
    And I follow "Edit Question"
    And I upload the last "Answer image" with "pigeon.png"
    And I press "Update Question"
    Then I should see "Does it have a numbered band?"
    And I should see "pigeon.png"

Scenario: Admin adds subquestions to an existing question
    Given I am logged in and on the admin page
    And I follow "Questions"
    And I follow the first question
    And I follow "Add Nested Questions"
    And I fill in the last "Content*" with "Which of the following photos resembles the pigeon the most?"
    And I follow "Add Answer"
    And I fill in the last "Img url" with "img_url_1.png"
    And I follow "Add Answer"
    And I fill in the last "Img url" with "img_url_2.png"    
    And I press "Update Question"
    Then I should see "Which of the following photos resembles the pigeon the most?"
    And I should see "img_url_1.png"
    And I should see "img_url_2.png"

Scenario: Admin configures the threshold value for hurt pigeons
    Given I am logged in and on the admin page
    Given I see "Threshold: 5"
    And I follow "Questions"
    And I follow "Reset threshold"
    And I fill in the last "Value" with 10
    And I press "Update Threshold"
    Then I should see "Threshold: 10"