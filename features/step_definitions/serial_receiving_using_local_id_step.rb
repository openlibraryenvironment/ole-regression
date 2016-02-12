When(/^I search record local identifier and start creating serial receiving transaction$/) do

  @marc_editor = make Marc_editor , :item_barcode => uniq_number  ,:title => uniq_alphanums
  @marc_editor.create_bib
  @marc_editor.create_holding

  @serial_receiving = make Serial_receiving_transaction , :item_identifier => @marc_editor.item_barcode , :doc_type => "Item Barcode" ,:search_conditions => "Local Identifier" , :line_level => 3 ,:local_id => @marc_editor.local_item_id
  @serial_receiving.create_serial_receiving_transaction
end

Then(/^document status should be in SAVED$/) do
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