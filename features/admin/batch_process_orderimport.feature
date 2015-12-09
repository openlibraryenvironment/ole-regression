@nightly @admin
Feature: Batch_Process_order_import

 Scenario: Order import in batch process with marc only
  Given I logged in with user name ole-quickstart
  When I select Order Import Profile and upload a marc file and start the job
  Then the jobstatus should be COMPLETED, total records and number of orders added successfully should be equal

 Scenario: Order import in batch process with marc and edi
  Given I logged in with user name ole-quickstart
  When I select Order Import Profile and upload a marc and edi file and start the job
  Then the job status should be COMPLETED, total records and number of orders added successfully should be equal