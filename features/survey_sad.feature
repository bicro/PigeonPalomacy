Feature: Should I help the pigeon survey Sad paths
  
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
 
# ice-boxed for iter-4
 
# Scenario: Filling out no answers should fail
#  Given I am on the survey page
#  And I press "Find Expert"
#  Then I should see "You did not complete the survey."

# Scenario: Filling out partial information should fail
#  Given I am on the survey page
#  When I mark the first answer
#  And I press "Find Expert"
#  Then I should see "You did not complete the survey."

