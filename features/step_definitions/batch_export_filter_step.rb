When(/^I select Batch Export filter profile and start the job$/) do
  @batch_exp = make BatchProcesses  , :batchexport_profile_name => "Test_Batch_Export_Filter"
  @batch_exp.batch_export
end

Then(/^the job status should be completed, total records and success records should be equal$/) do

  on Batch_process do |page|
    page.per_complete.should == "100.00%"
    sleep(5)
    page.windows[1].close
  end
  end

