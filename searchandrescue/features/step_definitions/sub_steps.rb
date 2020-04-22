Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I click on sub$/) do
  click_on "sub"
end

Then(/^I should see "([^"]*)"$/) do |arg|
  expect(page).to have_content arg
end