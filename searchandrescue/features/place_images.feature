Feature: Place Images
  Test the place images button

  @javascript
  Scenario: User clicks place images
    Given I am on the home page
    When I click on place images
    Then I should see user clicked "place images"