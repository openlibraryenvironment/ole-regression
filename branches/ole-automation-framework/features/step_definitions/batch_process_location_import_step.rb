When(/^I select Location import profile and upload a xml file$/) do
  @location_imp = make BatchProcesses , :file_name => "DefaultLibraryLocations1" , :file_type => "xml"
  @location_imp.location_import
end

Then(/^the status should be COMPLETED$/) do
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