#Done for iteration 1
Feature: Add Restaurants
  As a new restaurant
  I want to to request and receive restaurant account
  So that I can begin adding deals
  
Scenario: Add a new restaurant (Sad Path)
  Given I am on the "request account page"
  And I have filled out the request form with name "", with email "zmariks@email.com"
  Then I should be on the "request account page"
  And I should see a notice of "Error: Name can't be blank. Name is too short (minimum is 3 characters)." 
  
  Given I am on the "request account page"
  And I have filled out the request form with name "Zmariks", with email ""
  Then I should be on the "request account page"
  And I should see a notice of "Error: Email can't be blank. Email is invalid." 
  
  Given I am on the "request account page"
  And I have filled out the request form with name "Zm", with email "zmariks@email.com"
  Then I should be on the "request account page"
  And I should see a notice of "Error: Name is too short (minimum is 3 characters)."
  
  Given I am on the "request account page"
  And I have filled out the request form with name "Zmariks", with email "zmariks"
  Then I should be on the "request account page"
  And I should see a notice of "Error: Email is invalid."
  
    
Scenario: Add a new restaurant (Happy Path)
  Given I am on the "request account page"
  Given I have filled out the request form with name "Pancheros", with email "pancheros@email.com"
  Then I should be on the "login page"
  And I should see a notice of "Welcome Pancheros. Please wait for a follow-up email."
  
Scenario: Add a restaurant that exists (Sad Path)
  Given the restaurant with name "Test", password "password", email "test@email.com", invitationID "1"
  And I am on the "request account page"
  And I have filled out the request form with name "Test", with email "test@email.com"
  Then I should be on the "request account page"
  And I should see a notice of "Error: Name has already been taken. Email has already been taken."
  
  