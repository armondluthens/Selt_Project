Feature: Login as Restaurant
  As a restaurant
  I want to be able to securely login into my account
  So that I can act as a restaurant account
  
Scenario: Login as Restaurant (Declarative)
  Given the restaurant with name "Test", password "password", email "test@email.com", invitationID 1;
  When I login with name "Test", password "password", email "test@email.com"
  Then I should go to the home page
  And I should see "You are logged in as Test"