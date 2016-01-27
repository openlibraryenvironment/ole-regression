@6206
Feature:EDIFACT invoice load

  Scenario: EDIFACT invoice load
    Given Logged in with ole-quickstart for InvoiceImport
    When I tried to load the attached EDIFACT invoice supplied by Harrassowitz
    Then the invoice should be successfully created and Extended cost,Invoiced price and gross total amount should be same