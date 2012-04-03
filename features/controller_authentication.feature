Feature: Controller Authentication 
  In order to protect controllers and methods from unauthenticated users
  A user
  Should signed in before having access to some methods.
  
  Background:
    Given I am on the home page
  
  Scenario: User who is not logged in visits protected controller that requires authentication to view
    Given I am not logged in
    When I go to the blog page
    Then I should see "Sign In"
    And I should not see "Listing blogs"
    And I should not see "New Blog"
    And I should be signed out
    
  Scenario: User who is not logged in visits page that is not protected within the controller that has protection
    Given I am not logged in
    When I go to the articles page
    Then I should see "Sign In"
    And I should see "Listing articles"
    And I should be signed out
    
  Scenario: User who is not logged in visits page that is protected within the controller that is partially protected
    Given I am not logged in
    And there is an article created with a title of "My First Article" and a body of "This is the body of my first article"
    When I go to the articles page
    And I follow "Show"
    Then I should see "Sign In"
    And I should not see "My First Article"
    And I should not see "This is the body of my first article"
    And I should be signed out
    
  Scenario: User is able to view protected controller that requires authentcation to view
    Given I am not logged in
    And I am a user with an email "user@test.com" and password "please"
    When I go to the sign in page
    And I sign in as "user@test.com/please"
    Then I should see "Signed in successfully"
    And I should be signed in
    When I go to the blog page
    And I should see "Listing blogs"
    And I should see "New Blog"
    And I should not see "Sign In"
    
  Scenario: User who is logged in visits page that is protected within the controller that is partially protected
    Given I am not logged in
    And I am a user with an email "user@test.com" and password "please"
    And there is an article created with a title of "My First Article" and a body of "This is the body of my first article"
    When I go to the sign in page
    And I sign in as "user@test.com/please"
    Then I should see "Signed in successfully"
    And I should be signed in
    When I go to the articles page
    And I follow "Show"
    Then I should not see "Sign In"
    And I should see "My First Article"
    And I should see "This is the body of my first article"
  
