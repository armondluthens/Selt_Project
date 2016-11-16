#TODO
Feature: Add a Deal
  As a Restaurant
  I want to be able to add a new deal to my deals
  So that browsers can see them on the home page

Scenario: Add a new deal (Declarative)
    Given the following deal has been added to IowaCityEats:
#  | title                   | start_date | end_date | description | 
#  | Mac Monday               25-Nov-1992 |
  When I have added the deal with title "Mac Monday" and description "Large size bowl for small bowl price" as restaurant "Za'Marics" 
  And I am on the "home page"
  Then I should see a deals list entry with title "Mac Monday" and description "Large size bowl for small bowl price" as restaurant "Za'Marics"
  