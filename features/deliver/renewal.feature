@nightly
  Feature: OLE.Renew
    Scenario: Renew item
      Given I Logged in as ole-quickstart
      When I altered the due date for loaned item
      Then The due date should be updated

    Scenario: Renewal for proxy patron's item
      Given Log in as ole-quickstart
      When I checkout an item with proxy patron and try to renew that item
      Then the item due date should be updated successfully