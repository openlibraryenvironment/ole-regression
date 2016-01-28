@nightly @selectacquire @2.0
Feature: OLE.Vendor

  Scenario: Verify that a vendor can be successfully created
    Given I logged-in with ole-quickstart
    When I give vendor name , vendor address and save it
    Then the vendor state should be in saved