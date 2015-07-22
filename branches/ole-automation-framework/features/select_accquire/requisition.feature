@nightly @requisition
Feature: OLE.Requisition

  Scenario: PL 1.1.1 Verify that a requisition can be successfully created
    Given I am logged in as an acquisition staff
    When I initiate a requisition document
    Then a requisition should be successfully created