Feature: Adding things to a survey
  In order to specify the contents of a survey
  As a user
  I want to be able to add field groups and fields
  
  @selenium
  Scenario: Sanity-check the pre-JS document structure
    Given a survey schema exists
    And I am on the edit page for that survey schema
    Then I should see "Untitled Survey"
  
  @selenium
  Scenario: Adding field group
    Given a survey schema exists
    And I am on the edit page for that survey schema
    Then I should not see "Field Group"
    When I click the 'Add field group' link
    And I wait for "delete field group" to appear
    Then I should see "Field Group"
