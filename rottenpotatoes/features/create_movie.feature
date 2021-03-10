Feature: create a new movie
 
  As a moviegoer
  So that I can add the new movie
  I want to see a new movie

Scenario: create a new movie
  When  I am on the new page
  And   I fill in "Title" with "Advenger"
  And   I press "Save Changes"
  Then  I should be on the home page
  And   I should see "Advenger was successfully created"

Scenario: create a new movie
  When  I am on the new page
  And   I fill in "Title" with "Iron Man"
  And   I press "Save Changes"
  Then  I should be on the home page
  And   I should see "Iron Man was successfully created"