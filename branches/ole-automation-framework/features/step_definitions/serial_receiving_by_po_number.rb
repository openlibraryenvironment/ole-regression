Given(/^I log in with user name ole-quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I search record using po number and start creating serial receiving transaction$/) do
  create_requsition()
  search_created_req()
  @serial_receiving = make Serial_receiving_transaction , :po_number => $purchase_order_number , :search_conditions => "Purchase Order No" , :line_level => 4
  @serial_receiving.create_serial_receiving_transaction
end

Then(/^the document should be in SAVED status$/) do
    visit Serial_receiving do |page|
      page.doc_search
      sleep(3)
      page.doc_id.set $document_id
      page.search_req
      page.doc_id_link
      page.windows[4].use
      sleep(10)
      saved = page.doc_status
      puts saved
      page.doc_status.should == "SAVED"
    end
end