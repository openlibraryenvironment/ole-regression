When(/^I select Batch Export incremental profile and start the job$/) do
  @batch_increment = make BatchProcesses  , :batchexport_profile_name => "Test_Batch_Export_Incremental" , :var => 1
  @batch_increment.batch_export
  @marc_editor = make Marc_editor ,:title => uniq_alphanums
  @marc_editor.create_bib
  @batch_inc = make BatchProcesses  , :batchexport_profile_name => "Test_Batch_Export_Incremental"
  @batch_inc.batch_export
end