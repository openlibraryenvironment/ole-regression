@nightly
  Feature: OLE.Item renewal
    Scenario: Renew an item
      Given I'm logged-in with ole-quickstart
      When I changed the due date for loaned item
      Then item due date should be updated