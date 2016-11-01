#TODO
Feature: Allow Restuarant user to add a new deal on IowaCityEats
  
Scenario: Add a new deal (Declarative)
  When I have added the deal with title "Mac Monday" and description "Large size bowl for small bowl price"
  And I am on the IowaCityEats home page
  Then I should see a deals list entry with title "Mac Monday" and description "Large size bowl for small bowl price"