Feature: Login as Restaurant
  As a restaurant
  I want to be able to securely login into my account
  So that I can act as a restaurant account
  
Scenario: Login as Restaurant (Sad Path)
  Given I am on the "login page"
  When I login with name "Incorrect", password "Incorrect"
  Then I should be on the "login page"
  And I should see a notice of "Invalid credentials. Re-enter, or click Sign-up for an account"
  
Scenario: Login as Restaurant (Declarative)
  Given the restaurant with name "Test", password "password", email "test@email.com", invitationID "1"
  And I am on the "login page"
  And I login with name "Test", password "password"
  Then I should be on the "home page"
  And I should see a notice of "You are logged in as Test"
  
Scenario: Forgot Account ID Link 
  Given I am on the "login page"
  When I click the "Forgot Account ID or Password" link 
  Then I should be on the "home page" 
  #implement later 
  
Scenario: Register for an Account Link 
  Given I am on the "login page"
  When I click the "Register for an Account" link 
  Then I should be on the "request account page"