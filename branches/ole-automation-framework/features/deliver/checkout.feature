@nightly
Feature: OLE.Checkout an Item

  Scenario: Checkout an item with valid patron
    Given I'm logged-in with ole-quickstart
    When I give valid patron barcode for checkOut an item
    Then Item status should be loaned