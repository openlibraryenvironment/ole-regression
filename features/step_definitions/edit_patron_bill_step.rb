When(/^I create patron bill and another fee type and fee amount$/) do
  @createpatronbill = create PatronObject , :patron_barcode => uniq_alphanums
  @fee_amount = "100"
  @createpatronbill.create_patron_bill(@fee_amount,@createpatronbill.patron_barcode)

  @editpatronbill = make Edit_patron_bill_dataobject , :patron_id => @createpatronbill.patron_id
  @editpatronbill.edit_patron_bill(@fee_amount)
end

Then(/^the patron bill's total amount should updated$/) do
 visit Edit_patron_bill_page do |page|
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
  fee1 = page.total_fee_amount(opts=line_level=0)
  fee2 = page.total_fee_amount(opts=line_level=1)
  puts fee1+fee2
  page.total_amount.should == fee1+fee2
  page.windows[1].close
 end
end