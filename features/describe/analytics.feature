@nightly
  Feature: Analytics
    Scenario: Keep an item in morethan one holding
      Given I am logged in as ole-quickstart to do analytics
      When I create two items and linked into multiple holding
      Then the item should present in both holdings