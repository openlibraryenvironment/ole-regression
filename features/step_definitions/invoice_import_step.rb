When(/^I select Invoice Import Profile and upload a marc file and start the job$/) do
  @invoice_import = make BatchProcesses , :file_name => "ole310a" , :file_type => "mrc"
  @invoice_import.create_invoice_import
end

Then(/^the job status should be successfully COMPLETED, total records and success records should be equal$/) do
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
    page.job_status.should == "Invoice Ingest executed successfully."
    #page.windows[2].close
    #page.windows[1].close
    #page.windows[0].use
    #page.doc_search
    #sleep(5)
    #page.search_document
    #sleep(5)
    #page.doc_id_link
    #page.windows[1].use
    #sleep(5)
    #page.invoice_doc.should == "Invoice"
    #page.invoice_status.should == "SAVED"
  end
end