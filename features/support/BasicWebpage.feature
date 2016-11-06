Feature: Basic webpage functions
  As a browser of IowaCityEats
  I want the website to have functions of a basic webpage
  So that users enjoy and understand using the site
  
Scenario: Home button
  Given I am on the home page
  When I click IowaCityEats at the top of the page
  Then I should go to the home page
  
  Given I am on a deals page
  When I click IowaCityEats at the top of the page
  Then I should go to the home page
  
  Given I am on the restaurants page
  When I click on the IowaCityEats at the top of the page
  Then I should go to the home page