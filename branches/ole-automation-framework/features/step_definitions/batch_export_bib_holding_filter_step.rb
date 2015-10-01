When(/^I select Batch Export bib and holding filter profile and start the job$/) do
  @batch_full = make BatchProcesses  , :batchexport_profile_name => "Test_Batch_Export_BibAndHoldings_Filter"
  @batch_full.batch_export
end