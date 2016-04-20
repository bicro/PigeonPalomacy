Feature: Admin should be able set threshold

Background: 
  Given the following admins exist:
    | email | password |
    | admin5@example.com | password |
  
  
Scenario: Admin cannot set hurt threshold to non-numerical value
    Given I am logged in and on the admin page
    Then I follow "Settings"
    And I follow the hurt threshold
    When I set hurt threshold to be a string of "one"
    And I press "Update Setting"
    Then I should see "Hurt Threshold should be numeric"

