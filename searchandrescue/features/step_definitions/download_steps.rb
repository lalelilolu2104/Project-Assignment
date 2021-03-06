Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I click on download/) do
  click_on "download"
end

Then(/^I should see "([^"]*)"$/) do |arg|
  expect(page).to have_content arg
end