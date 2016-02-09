@nightly @deliver
  Feature: Create an item
    Scenario: Create an item
      Given Logged in with ole-quickstart for create an item
      When I give all required values to create an item
      Then the item should be created successfully