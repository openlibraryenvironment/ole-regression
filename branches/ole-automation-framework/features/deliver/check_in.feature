
@nightly
Feature: OLE.CheckinItem

  Scenario: PL 1.1.3 Checkin an item
  Given Logged in with ole-quickstart
  When Get item id for checkin
  Then Item status should be Recently Returned
