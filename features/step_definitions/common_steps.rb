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
    row[:skills] = row[:skills].split(",").map { |skill| Skill.find_or_create_by_description(skill.sub("\s","")) }
    @users << User.create(row.merge(password: password, password_confirmation: password))
  end
end

Then /^I should see a list of those users$/ do
  [:name, :location, :skills].each { |attr| page.should have_content(@user[attr]) }
end