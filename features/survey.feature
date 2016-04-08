Feature: Should I help the pigeon survey
  
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
 
Scenario: A user with a hurt pigeon should get help
 Given I am on the survey page
 When I mark the answers for an injured pigeon
 And I press "Find Expert"
 Then I should see "Your pigeon needs help."

Scenario: A user with an unhurt pigeon should not get help
 Given I am on the survey page
 When I mark the answers for an uninjured pigeon
 And I press "Find Expert"
 Then I should see "Your pigeon is fine."

Scenario: Review answers
 Given I am an user
 And I am on the survey page
 When I press �Continue�
 Then I should be on the submission page
 And I should see the answers

Scenario: Send the results
 Given I am an user
 And I am on the submission page
 When I press �Send�
 Then I should see �The results have been successfully sent to an expert�

Scenario: Show pigeon rescuer map
 Given I am an user
 And I am on the submission page
 When I press �Send�
 Then I should see an image with uri �www.maps.google.com.�

Scenario: Show preferred expert contact method
 Given I am an user
 And I am on the submission page
 When I press �Send�
 Then I should see �Contact Name:�
 Then I should see �Contact Information:�