When(/^I search item record using title and start creating serial receiving transaction$/) do

  @marc_editor = make Marc_editor , :item_barcode => uniq_number , :title => uniq_alphanums
  @marc_editor.create_bib
  @marc_editor.create_holding
  @marc_editor.create_item

  @serial_receiving = make Serial_receiving_transaction , :title => @marc_editor.title ,:search_conditions => "Title" , :line_level => 0 , :enum_level1 => "3",:enum_level2 => "4", :chron_level1 => "1991" , :chron_level2 => "Nov"
  @serial_receiving.create_serial_receiving_transaction
end

Then(/^document should be in SAVED status$/) do
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
