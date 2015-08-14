Given(/^I log in as ole_quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I give feetype and amount in patron bill$/) do
  @patronbill = create PatronObject , :patron_barcode => uniq_alphanums
  @patron_amount = "100"
  @patronbill.create_patron_bill(@patron_amount)
end

Then(/^the patron bill should create with current date$/) do
  on PatronPage do |page|
    page.search_patron_barcode
    sleep(5)
    page.enabled_patron_bill.exists?.should be_true
    page.patron_bill_link
    sleep(5)
    page.windows[1].use
    puts $fee_amount
    page.view_patron_amount.should == $fee_amount
    page.bill_date.should == Date.today.strftime("%m/%d/%Y")
    page.windows[1].close
    sleep(5)
    page.doc_search
    sleep(3)
    page.doc_id.set $document_id
    sleep(3)
    page.search
    sleep(10)
    page.doc_id_link
    page.windows[1].use
    sleep(10)
    saved = page.doc_status
    puts saved
    page.doc_status.should == "FINAL"
    sleep(5)
  end
end