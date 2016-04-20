Feature: Admin should be able to login, see and edit questions (Sad Paths)
  
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

Scenario: Admin cannot leave content of a question blank
    Given I am logged in and on the admin page
    And I follow "Questions"
    And I follow "New Question"
    And I press "Create Question"
    Then I should see "can't be blank"

Scenario: Non-admin cannot bypass admin login to create new questions
    When I attempt to be on the admin new question page
    Then I should be on the admin login page