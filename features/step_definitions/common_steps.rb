Given /^I am on the sign up page$/ do
  visit new_user_registration_path
end

Given /^I fill in "(.*?)" with "(.*?)"$/ do |field, text|
  fill_in field, with: text
end

Given /^I choose "(.*?)"$/ do |radio_label|
  choose(radio_label)
end

Given /^I click the "(.*?)" button$/ do |button|
  click_button button
end

Then /^I should see the message "(.*?)"$/ do |message|
  page.should have_content(message)
end

Then /^show me the page$/ do
  save_and_open_page
end