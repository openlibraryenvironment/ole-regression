When(/^I select Batch delete profile and upload mrc or text file$/) do
  @batch_del = make BatchProcesses , :file_name => "marcimport8" , :file_type => "mrc"
  @batch_del.batch_delete_match_point
  @batch_del.batch_delete
end

Then(/^the job status should be COMPLETED successfully$/) do
  on Batch_process do |page|
    level = 0
    for level in 0 .. 25
      if (page.status == "COMPLETED" || page.status == "STOPPED")
        break
      else
        page.refresh_button
        sleep(5)
      end
    end
    page.per_complete.should == "100.00%"
    sleep(5)
    page.windows[1].close
  end
end