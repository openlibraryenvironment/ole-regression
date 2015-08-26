@nightly
Feature: E-Resource
  Scenario: Create new E-Resource document
    Given I logged in with ole-quickstart
    When I give material,format and content type and save the document
    Then the EResource document should be saved with the status saved

  Scenario: Link PO document to E-Resource document
    Given I logged in with ole-quickstart
    When I create PO and link it with E-Resource document
    Then the created PO id should be equal to linked PO id in the E-Resource document
