When(/^I select Serial record import profile and input type as xml or csv$/) do
  @serialrecord_import = make BatchProcesses
  @serialrecord_import.serial_record_import
end

Then(/^the job status should be successfully COMPLETED$/) do
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