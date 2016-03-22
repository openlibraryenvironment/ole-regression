Given(/^I log in as ole_quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I give feetype and amount in patron bill$/) do
  @patronbill = create PatronObject , :patron_barcode => uniq_alphanums
  @patron_amount = "100"
  @patronbill.create_patron_bill(@patron_amount,@patronbill.patron_barcode)
end

Then(/^the patron bill should create with current date$/) do
  on PatronPage do |page|
    page.doc_search
    sleep(3)
    page.doc_id.set $document_id
    sleep(3)
    page.search
    sleep(10)
    page.doc_id_link
    page.windows[1].use
    sleep(5)
    page.doc_status.should == "FINAL"
    sleep(3)
    page.bill_date.should == Date.today.strftime("%m/%d/%Y")
    puts $fee_amount
    page.view_patron_amount.should == $fee_amount
    page.windows[1].close
  end
end