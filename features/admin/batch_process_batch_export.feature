@nightly @admin
Feature: Batch_Process

  @2.0
  Scenario: Batch export filter in batch process
    Given I logged in with user name ole-quickstart
    When I select Batch Export filter profile and start the job
    Then the job status should be completed, total records and success records should be equal


  Scenario: Batch export full in batch process
    Given I logged in with user name ole-quickstart
    When I select Batch Export full profile and start the job
    Then the job status should be completed, total records and success records should be equal

  @2.0
  Scenario: Batch export incremental in batch process
    Given I logged in with user name ole-quickstart
    When I select Batch Export incremental profile and start the job
    Then the job status should be completed, total records and success records should be equal

  @2.0
  Scenario: Batch export bib only in batch process
    Given I logged in with user name ole-quickstart
    When I select Batch Export bib only profile and start the job
    Then the job status should be completed, total records and success records should be equal

  @2.0
  Scenario: Batch export bib holding in batch process
    Given I logged in with user name ole-quickstart
    When I select Batch Export bib holding profile and start the job
    Then the job status should be completed, total records and success records should be equal

  @2.0
  Scenario: Batch export bib only incremental in batch process
    Given I logged in with user name ole-quickstart
    When I select Batch Export bib only incremental profile and start the job
    Then the job status should be completed, total records and success records should be equal

  @2.0
  Scenario: Batch export bib only full in batch process
    Given I logged in with user name ole-quickstart
    When I select Batch Export bib only full profile and start the job
    Then the job status should be completed, total records and success records should be equal

  @2.0
  Scenario: Batch export bib and holding full in batch process
    Given I logged in with user name ole-quickstart
    When I select Batch Export bib and holding full profile and start the job
    Then the job status should be completed, total records and success records should be equal

#  Scenario: Batch export bib and holding filter in batch process
#    Given I logged in with user name ole-quickstart
#    When I select Batch Export bib and holding filter profile and start the job
#    Then the job status should be completed, total records and success records should be equal
#
#  Scenario: Batch export bib and holding incremental in batch process
#    Given I logged in with user name ole-quickstart
#    When I select Batch Export bib and holding incremental profile and start the job
#    Then the job status should be completed, total records and success records should be equal






