Feature: Logout as Restaurant
  As a restaurant
  I want to be able to securely logout of my account
  So that I can prevent others from editing my account 
  
Scenario: Logout as Restaurant (Declarative)
  Given I am on the "login page"
  When I login with name "TestRestaurant", password "test"
  Then I should be on the "home page"
  And I should see a notice of "Logout"
  When I click the "Log Out" button 
  Then I should be on the "home page"
  And I should see a notice of "Log in"
  