@nightly
Feature: OLE.RecallRequest
  Scenario: Deliver recall request for an item
    Given I'm logged-in with ole-quickstart
    When I'm raising the recall request for loaned item
    Then the request type should be RecallDeliverRequest

  Scenario: Recall hold request for an item
    Given I'm logged-in with ole-quickstart
    When I'm setting pick up location for an item
    Then the request type should be RecallHoldRequest
