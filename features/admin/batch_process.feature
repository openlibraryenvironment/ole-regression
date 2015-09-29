#@nightly
#Feature: Batch_Process
#  Scenario: Bib import in batch process
#    Given I logged in with user name ole-quickstart
#    When I select Bib Profile and upload a marc file and start the job
#    Then the job status should be COMPLETED, total records and success records should be equal
#
#  Scenario: Order import in batch process with marc only
#    Given I logged in with user name ole-quickstart
#    When I select Order Import Profile and upload a marc file and start the job
#    Then the jobstatus should be COMPLETED, total records and number of orders added successfully should be equal
#
#  Scenario: Order import in batch process with marc and edi
#    Given I logged in with user name ole-quickstart
#    When I select Order Import Profile and upload a marc and edi file and start the job
#    Then the job status should be COMPLETED, total records and number of orders added successfully should be equal
#
#  Scenario: Invoice import in batch process
#    Given I logged in with user name ole-quickstart
#    When I select Invoice Import Profile and upload a marc file and start the job
#    Then the job status should be successfully COMPLETED, total records and success records should be equal
