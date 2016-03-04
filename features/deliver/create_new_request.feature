@nightly @deliver
  Feature: OLE Request
    Scenario: Create new request
      Given I am log-in with ole-quickstart
      When I give request type , patron and item informations in request screen
      Then the request should be created successfully