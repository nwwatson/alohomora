Feature: Sign up
  In order to be able to use the system
  A visitor
  Should be able to sign up
  
  Background:
    Given I am not logged in
    And I am on the home page
    And I go to the sign up page

    Scenario: User signs up with valid data
      And I fill in the following:
        | Email                 | test@entropisoftware.com  |
        | First Name            | Wasting                   |
        | Last Name             | Light                     |
        | Organization          | Entropi Software          |
        | Password              | please                    |
        | Password confirmation | please                    |
      And I press "Sign Up"
      Then I should see "An email has been sent to you"