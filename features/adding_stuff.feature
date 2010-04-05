@selenium
Feature: Adding things to a survey
  In order to specify the contents of a survey
  As a user
  I want to be able to add field groups and fields
  
  Scenario: Sanity-check the pre-JS document structure
    Given a survey schema exists
    And I am on the edit page for that survey schema
    Then I should see "Untitled Survey"
  
  Scenario: Adding field group
    Given a survey schema exists
    And I am on the edit page for that survey schema
    Then I should not see "Field Group"
    When I click the 'Add field group' link
    And I wait for "delete field group" to appear
    Then I should see "Field Group"
    When I press "Save changes"
    Then I should see "Successfully saved survey."
    And I should see "Field Group 1"
    And a field group should exist
    When I fill in "This field group's title" for the title of field group 0
    And I press "Save changes"
    Then the title of field group 0 should be "This field group's title"

  #Scenario: Adding a field
  #  Given a survey schema exists
  #  And that survey schema has 1 field group
  #  And I am on the edit page for that survey schema
  #  Then I should see that field group's 
  #  When I click the "SingleLineTextBox" link
  #  And I wait for "delete field" to appear
  #  Then I should see "delete field"
  #  When I press "Save changes"