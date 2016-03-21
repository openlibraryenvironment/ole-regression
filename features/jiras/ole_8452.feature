@8452
Feature: Display checkin date in patron bill summary
  Scenario: Display checkin date in patron bill summary
    Given I am log-in with olequickstart
    When I am returning an item
    Then the checkin date should be appeared in the item details section of the patron bill