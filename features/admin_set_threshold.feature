Feature: Admin should be able set threshold

Background: 
  Given the following admins exist:
    | email | password |
    | admin5@example.com | password |
  
  
Scenario: Admin edits hurt threshold
    Given I am logged in and on the admin page
    Then I follow "Settings"
    And I follow the hurt threshold
    When I set hurt threshold to be a float of "5.0"
    And I press "Update Setting"
    Then I should be on the settings page
    And I should see "Hurt Threshold"
    And I should see "5.0"

