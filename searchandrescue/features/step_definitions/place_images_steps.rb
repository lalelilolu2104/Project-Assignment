Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I click on place_images$/) do
  click_on "place_images"
end

Then(/^I should see "([^"]*)"$/) do |arg|
  expect(page).to have_content arg
end