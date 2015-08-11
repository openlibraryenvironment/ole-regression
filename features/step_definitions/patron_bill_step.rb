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
    page.enabled_patron_bill.exists?.should be_true
    page.patron_bill_link
    sleep(5)
    page.windows[1].use
    puts $fee_amount
    page.view_patron_amount.should == $fee_amount
    page.bill_date.should == Date.today.strftime("%m/%d/%Y")
  end
end