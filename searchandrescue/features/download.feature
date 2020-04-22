Feature: Download
  Test the download button

Scenario: User clicks download
  Given I am on the home page
  When I click on download
  Then I should see user clicked "download"