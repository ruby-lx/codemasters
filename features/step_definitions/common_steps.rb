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

Given /^I click the "(.*?)" link$/ do |link|
  click_link link
end

Then /^I should see the message "(.*?)"$/ do |message|
  page.should have_content(message)
end

Then /^show me the page$/ do
  save_and_open_page
end

Given /^I am a new, authenticated user$/ do
  email = 'john.doe@mia.com'
  password = '123123123'
  @user = User.new(email: email, password: password, password_confirmation: password,
           name: 'John Doe', location: 'Lisbon', master: true)
  @user.save!

  visit new_user_session_path
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end

Then /^I should see my profile$/ do
  [:name, :email, :location].each { |attr| page.should have_content(@user[attr]) }
end

Given /^that the following users already exist$/ do |table|
  password = '123123123'
  @users = []

  table.hashes.each do |row|
    skills = row[:skills].split(",").map { |skill| Skill.find_or_create_by_description(skill.sub("\s","")) }
    row.delete("skills")

    user = User.new row.merge(password: password, password_confirmation: password, master: true)
    user.skills << skills
    user.save

    @users << user
  end
end

Then /^I should see a list of those users$/ do
  [:name, :location, :skills].each do |attr|
    @users.each { |user| page.should have_content(user[attr]) }
  end
end

Given /^I visit the profile for the user "(.*?)"$/ do |email|
  visit user_path(User.find_by_email(email))
end

Given /^I click the "(.*?)" button next to skill "(.*?)"$/ do |button, search_term|
  within(:xpath, "//li[contains(string(),'#{search_term}')]") do
    click_button button
  end
end

Given /^I confirm$/ do
  page.driver.browser.switch_to.alert.accept
end

Then /^I should not see "(.*?)"$/ do |content|
  page.should_not have_content(content)
end