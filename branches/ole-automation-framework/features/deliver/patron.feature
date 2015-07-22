@nightly
 Feature: OLE.Patron
   Scenario: Create a patron without proxypatron
    Given Log in as ole-quickstart
    When Create a new patron
    Then Patron status must be FINAL

   Scenario: Create a patron with proxypatron
    Given Log in with ole-quickstart
    When Create new patron with proxypatron
    Then Status should be FINAL

   Scenario: Add notes for patron
     Given I am logged in as ole-quickstart
     When I create a new patron with notes
     Then Patron status should be FINAL

   Scenario: Delete notes for patron
     Given I am logged in with ole-quickstart
     When I have edited a patron with notes
     Then the deleted note no longer exists




