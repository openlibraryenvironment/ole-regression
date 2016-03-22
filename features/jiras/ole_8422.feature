@8422
  Feature: Check for fines on proxy borrowers after check for proxy
    Scenario: Check for fines on proxy borrowers after check for proxy
      Given I am log-in as ole-quickstart
      When I add fines to proxy patron
      Then the fines info should come after the proxy patron pop up in loan screen