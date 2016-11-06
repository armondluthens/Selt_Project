Feature: Add Restaurants
  As a new restaurant
  I want to to request and receive restaurant account
  So that I can begin adding deals
  
Scenario: Add a new restaurant (Declarative)
  Given I have added a restaurant with name "Panchros", with email "panchros@email.com"
  And I am on the IowaCityEats home page
  Then I should see a restaurant account with name "Panchros"
  
  