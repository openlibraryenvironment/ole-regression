Given(/^I log-in with user name ole-quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I search record using PO number and start creating serial receiving transaction$/) do
  @requisition = make Requisition
  @requisition.create_requsition
  @requisition.get_PO_number

  @serial_receiving = make Serial_receiving_transaction , :po_number => @requisition.purchase_order_number , :search_conditions => "Purchase Order No" , :line_level => 4
  @serial_receiving.create_serial_receiving_transaction
end

Then(/^the document should be in SAVED status$/) do
    visit Serial_receiving do |page|
      page.doc_search
      sleep(3)
      page.doc_id.set $document_id
      page.search_req
      page.doc_id_link
      page.windows[1].use
      page.doc_element.wait_until_present
      saved = page.doc_status
      puts saved
      page.doc_status.should == "SAVED"
      page.windows[1].close
    end
end