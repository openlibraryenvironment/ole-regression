@nightly @8009
Feature: OLE.Renew for proxy patron's item

  Scenario: Renewal for proxy patron's item
    Given Log in as ole-quickstart
    When I checkout an item with proxy patron and try to renew that item
    Then the item due date should be updated successfully