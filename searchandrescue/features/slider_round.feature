Feature: Slider Round
  Test the slider round button

@javascript
Scenario: User clicks slider round
  Given I am on the home page
  When I click on slider round
  Then I should see user clicked "slider round"