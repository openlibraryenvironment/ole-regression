When(/^I select Order Import Profile and upload a marc and edi file and start the job$/) do

  @order_import = make BatchProcesses , :bib_import_file_name => "7eocra" , :bib_import_file_type => "mrc", :order_import_file_name => "7eocra" , :order_import_file_type => "edi", :profile_type => "marc and edi"
  @order_import.choose_file_type
  @order_import.create_order_import

end

Then(/^the job status should be COMPLETED, total records and number of orders added successfully should be equal$/) do
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