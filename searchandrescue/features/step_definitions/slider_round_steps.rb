Given(/^I am on the home page$/) do
  visit root_path
end

When(/^I click on slider round/) do
  %{I press "slider round"}
end

Then(/^I should see "([^"]*)"$/) do |arg|
  expect(page).to have_content arg
end