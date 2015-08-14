When(/^I select Order Import Profile and upload a marc file and start the job$/) do

  @order_import = make BatchProcesses , :bib_import_file_name => "7eocra" , :bib_import_file_type => "mrc", :profile_type => "marc only"
  @order_import.choose_file_type
  @order_import.create_order_import

end

Then(/^the jobstatus should be COMPLETED, total records and number of orders added successfully should be equal$/) do
  on Batch_process do |page|
    level = 2
    for level in 0 .. 25
      if page.status == "COMPLETED"
        break
      else
        sleep(20)
        page.refresh_button
        sleep(20)
      end
    end
    page.per_complete.should == "100.00%"
    page.view_report
    sleep(10)
    page.windows[2].use
    sleep(10)
    page.total_no_of_records.should == page.order_import_success_count
    page.order_import_failure_count.should == "0"
    page.job_status.should == "Staff Upload executed successfully."
  end
end