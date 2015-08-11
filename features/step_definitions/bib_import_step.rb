Given(/^I logged in with user name ole-quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I select Bib Profile and upload a marc file and start the job$/) do
  @bib_import = make BatchProcesses , :bib_import_file_name => "10Marc" , :bib_import_file_type => "mrc"
  @bib_import.create_bib_import
end

Then(/^the job status should be COMPLETED, total records and success records should be equal$/) do
  #@bib_import.bib_import_status
  on Batch_process do |page|
    level = 2
    for level in 0 .. 25
      if page.status == "COMPLETED"
        break
      else
        page.refresh_button
        sleep(5)
      end
    end
    page.per_complete.should == "100.00%"
    page.view_report
    sleep(10)
    page.windows[2].use
    sleep(10)
    page.total_no_of_records.should == page.no_of_success_records
    page.no_of_failure_records.should == "0"
    page.job_status.should == "Batch Operation Completed"
  end
end
