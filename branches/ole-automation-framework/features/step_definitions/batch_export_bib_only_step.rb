When(/^I select Batch Export bib only profile and start the job$/) do
  @batch_bib = make BatchProcesses  , :batchexport_profile_name => "Test_Batch_Export_BibOnly_ex_staff"
  @batch_bib.batch_export
end