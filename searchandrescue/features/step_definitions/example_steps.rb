When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the example range message$/) do
  expect(page).to have_content("Example range")
end