
@nightly
Feature: Request queue positions

  Scenario: check request queue positions
    Given Logged in with ole-quickstart to check request queue position
    When I create hold-hold request and return that item
    And I create recall-hold request for the same item which is in ONHOLD status
    Then the request queue position should be 1 for hold-hold and 2 for recall-hold