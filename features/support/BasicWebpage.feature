#Done for iteration 1 
Feature: Basic webpage functions
  As a browser of IowaCityEats
  I want the website to have functions of a basic webpage
  So that users enjoy and understand using the site
  
Scenario: Home button
  Given I am on the "home page"
  When I click the "Iowa City Eats!" link 
  Then I should be on the "home page"
  
  #deals page is home page currently 
  #Given I am on a deals page
  #When I click IowaCityEats at the top of the page
  #Then I should go to the "home page"
  
  Given I am on the "restaurants page"
  When I click the "Iowa City Eats!" link 
  Then I should be on the "home page"
  
Scenario: Login Button 
  Given I am on the "home page"
  When I click the "Log In" button
  Then I should be on the "login page"
  
Scenario: Request an Account Button 
  Given I am on the "home page"
  When I click the "Request an Account" button
  Then I should be on the "request account page"
  