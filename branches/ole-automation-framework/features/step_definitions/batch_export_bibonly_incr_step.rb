When(/^I select Batch Export bib only incremental profile and start the job$/) do
  @batch_increment = make BatchProcesses  , :batchexport_profile_name => "Test_Batch_Export_BibOnly_Incremental" , :var => 1
  @batch_increment.batch_export
  @marc_editor = make Marc_editor ,:title => uniq_alphanums
  @marc_editor.create_bib
  @bibonly_incr = make BatchProcesses  , :batchexport_profile_name => "Test_Batch_Export_BibOnly_Incremental"
  @bibonly_incr.batch_export
end