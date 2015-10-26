@nightly
  Feature: Transfer titles,holdings or items
    Scenario: Transfer an item to another location
      Given I am logged in as ole-quickstart to transfer item
      When I create two bibs and select item and holding to transfer
      Then the item should relocate properly