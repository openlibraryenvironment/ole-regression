@nightly @selectacquire
Feature: E-Resource
  Scenario: Create new E-Resource document
    Given I logged in with ole-quickstart
    When I give material,format and content type and save the document
    Then the EResource document should be saved with the status saved

  Scenario: Link PO document to E-Resource document
    Given I logged in with ole-quickstart
    When I create PO and link it with E-Resource document
    Then the created PO id should be equal to linked PO id in the E-Resource document

  @retest
  Scenario:Link existing E-Holding to E-Resource document
    Given logged in with ole-quickstart
    When I create new E-resource document and linking to the existsing E-Holdings
    Then the E-Holding details should be displayed in E-resource document
  @retest
  Scenario:Link new E-Holding with existing bib to E-Resource document
    Given logged in with ole-quickstart
    When I link to the existsing E-Holdings to the E-Resource document
    Then the E-Holding informations should be displayed in E-resource document

  @retest
  Scenario:Link new E-Holding with new bib to E-Resource document
    Given logged in with ole-quickstart
    When I create new E-resource document and adding new E-Holding in to it
    Then the added E-Holding should be displayed in E-resource document


