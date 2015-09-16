@nightly
  Feature: OLE.Checkin

    Scenario: Checkin an item
      Given I'm logged-in with ole-quickstart
      When I give valid item barcode to checkin that item
      Then the item status should be recently returned