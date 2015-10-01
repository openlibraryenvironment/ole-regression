When(/^I select Batch Export full profile and start the job$/) do
  @batch_full = make BatchProcesses  , :batchexport_profile_name => "Test_Batch_Export_full"
  @batch_full.batch_export
end