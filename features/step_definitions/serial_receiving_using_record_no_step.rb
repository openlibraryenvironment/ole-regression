When(/^I search record using serial receiving record number and update the record values$/) do
  @marc_editor = make Marc_editor , :item_barcode => uniq_number , :title => uniq_alphanums ,:issn_num => uniq_number
  @marc_editor.create_bib
  @marc_editor.create_holding
  @marc_editor.create_item

  @serial_receiving = make Serial_receiving_transaction , :title => @marc_editor.title ,:search_conditions => "Title" , :line_level => 0
  @serial_receiving.create_serial_receiving_transaction

  @serial_receiving_using_record_no = make Serial_receiving_transaction ,:search_conditions => "Serials Receiving Record No" , :line_level => 2 , :record_number => @serial_receiving.record_number
  @serial_receiving_using_record_no.create_serial_receiving_transaction
end

Then(/^document status should be saved$/) do
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