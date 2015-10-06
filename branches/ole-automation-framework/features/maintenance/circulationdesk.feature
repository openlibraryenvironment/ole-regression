Feature: OLE.CirculationDesk
  Scenario: Add pickup location for place request
    Given I am log in as ole-quickstart
    When I am setting pickup location
    Then document should be successfully submit


