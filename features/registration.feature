Feature: User registration as either master or apprentice
  In order to start using the site
  A visitor
  Should register himself

    Scenario: User registers himself as a master
      Given I am on the sign up page
      And I fill in "Name" with "John Doe"
      And I fill in "Location" with "Lisbon"
      And I fill in "Email" with "john.doe@mia.com"
      And I fill in "user_password" with "123123123"
      And I fill in "user_password_confirmation" with "123123123"
      And I choose "I'm a master"
      And I click the "Sign up" button
      Then I should see the message "Welcome! You have signed up successfully."

    Scenario: Logged in user navigates to his profile
      Given I am a new, authenticated user
      And I click the "profile" link
      Then I should see my profile

    Scenario: Logged in user can see list of other users
      Given that the following users already exist
        | name | email               | location | skills     |
        | rui  | rui.salgado@cake.ck | Lisbon   | Java, ruby |
      And I am a new, authenticated user
      Then I should see a list of those users
