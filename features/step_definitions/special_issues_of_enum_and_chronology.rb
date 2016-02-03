When(/^I add special issues of enumeration and chronology and receive it$/) do

  @marc_editor = make Marc_editor , :item_barcode => uniq_number , :title => uniq_alphanums
  @marc_editor.create_bib
  @marc_editor.create_holding
  @marc_editor.create_item

  @serial_receiving = make Serial_receiving_transaction , :title => @marc_editor.title ,:search_conditions => "Title" , :line_level => 0
  @serial_receiving.create_serial_receiving_transaction
  @serial_receiving.add_special_issues
end

Then(/^the  special issues informations should be saved$/) do
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

    page.show_enum_and_chrom
    page.enum_values.should  == @serial_receiving.issue_note
    page.windows[1].close
  end
end