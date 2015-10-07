When(/^I select Patron import profile and upload a xml file$/) do
  @patron_imp = make BatchProcesses , :file_name => "DefaultPatrons1" , :file_type => "xml"
  @patron_imp.patron_import
end

Then(/^the job status should be COMPLETED$/) do
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