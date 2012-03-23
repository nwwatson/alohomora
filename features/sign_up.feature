Feature: Sign up
  In order to be able to use the system
  A visitor
  Should be able to sign up
  
  Background:
    Given I am not logged in
    And I am on the home page
    And I go to the sign up page

    
    Scenario: Email address provided already has an account
      Given there is a a user exists with an email of "test@entropisoftware.com"
      And I fill in the following:
        | Email address         | test@entropisoftware.com  |
        | First name            | Wasting                   |
        | Last name             | Light                     |
        | Organization          | Entropi Software          |
        | Password              | !1please                  |
        | Password confirmation | !1please                  |
      And I press "Sign Up"
      Then I should see "has already been taken"
    
    Scenario: User signs up with valid data
      And I fill in the following:
        | Email address         | test@entropisoftware.com  |
        | First name            | Wasting                   |
        | Last name             | Light                     |
        | Organization          | Entropi Software          |
        | Password              | please                    |
        | Password confirmation | please                    |
      And I press "Sign Up"
      Then I should see "A message with a confirmation link has been sent to your email address"
      
    Scenario: User signs up with non matching passwords
      And I fill in the following:
        | Email address         | test@entropisoftware.com  |
        | First name            | Wasting                   |
        | Last name             | Light                     |
        | Organization          | Entropi Software          |
        | Password              | please                    |
        | Password confirmation | excuseme                  |
      And I press "Sign Up"
      Then I should see "Password doesn't match confirmation"
      
    Scenario: User signs up without passwords
      And I fill in the following:
        | Email address         | test@entropisoftware.com  |
        | First name            | Wasting                   |
        | Last name             | Light                     |
        | Organization          | Entropi Software          |
        | Password              |                           |
        | Password confirmation |                           |
      And I press "Sign Up"
      Then I should see "Password can't be blank"
      
    Scenario: User signs up with invalid email address
      And I fill in the following:
        | Email address         | testentropisoftware.com  |
        | First name            | Wasting                   |
        | Last name             | Light                     |
        | Organization          | Entropi Software          |
        | Password              | please                    |
        | Password confirmation | please                    |
      And I press "Sign Up"
      Then I should see "is not formatted properly"