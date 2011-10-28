@portfolios
Feature: Portfolios
  In order to have portfolios on my website
  As an administrator
  I want to manage portfolios

  Background:
    Given I am a logged in refinery user
    And I have no portfolios

  @portfolios-list @list
  Scenario: Portfolios List
   Given I have portfolios titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of portfolios
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @portfolios-valid @valid
  Scenario: Create Valid Portfolio
    When I go to the list of portfolios
    And I follow "Add New Portfolio"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 portfolio

  @portfolios-invalid @invalid
  Scenario: Create Invalid Portfolio (without title)
    When I go to the list of portfolios
    And I follow "Add New Portfolio"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 portfolios

  @portfolios-edit @edit
  Scenario: Edit Existing Portfolio
    Given I have portfolios titled "A title"
    When I go to the list of portfolios
    And I follow "Edit this portfolio" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of portfolios
    And I should not see "A title"

  @portfolios-duplicate @duplicate
  Scenario: Create Duplicate Portfolio
    Given I only have portfolios titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of portfolios
    And I follow "Add New Portfolio"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 portfolios

  @portfolios-delete @delete
  Scenario: Delete Portfolio
    Given I only have portfolios titled UniqueTitleOne
    When I go to the list of portfolios
    And I follow "Remove this portfolio forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 portfolios
 