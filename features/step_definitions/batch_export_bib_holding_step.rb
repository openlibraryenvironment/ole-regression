When(/^I select Batch Export bib holding profile and start the job$/) do
  @batch_full = make BatchProcesses  , :batchexport_profile_name => "Test_Batch_Export_BibHoldings_ex_staff"
  @batch_full.batch_export
end