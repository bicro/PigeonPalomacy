Feature: Admin should be able to upload images as answers to questions
  
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

Scenario: Admin adds image as answers to existing question
    Given I am logged in and on the admin page
    And I follow "Questions"
    And I follow the first question
    And I follow "Edit Question"
    And I upload the last "Answer image" with "pigeon.png"
    And I press "Update Question"
    Then I should see "Does it have a numbered band?"
    And I should see "pigeon.png"