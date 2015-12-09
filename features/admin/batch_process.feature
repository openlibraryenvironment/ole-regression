@nightly @admin
Feature: Batch_Process
  Scenario: Bib import in batch process
    Given I logged in with user name ole-quickstart
    When I select Bib Profile and upload a marc file and start the job
    Then the job status should be COMPLETED, total records and success records should be equal

  Scenario: Invoice import in batch process
    Given I logged in with user name ole-quickstart
    When I select Invoice Import Profile and upload a marc file and start the job
    Then the job status should be successfully COMPLETED, total records and success records should be equal

  Scenario: Batch delete in batch process
    Given I logged in with user name ole-quickstart
    When I select Batch delete profile and upload mrc or text file
    Then the job status should be COMPLETED successfully

  Scenario: Patron import in batch process
    Given I logged in with user name ole-quickstart
    When I select Patron import profile and upload a xml file
    Then the job status should be COMPLETED

  Scenario: Location import in batch process
    Given I logged in with user name ole-quickstart
    When I select Location import profile and upload a xml file
    Then the status should be COMPLETED