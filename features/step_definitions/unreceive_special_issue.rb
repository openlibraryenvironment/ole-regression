When(/^I removed special issue information$/) do

  @marc_editor = make Marc_editor , :item_barcode => uniq_number , :title => uniq_alphanums
  @marc_editor.create_bib
  @marc_editor.create_holding
  @marc_editor.create_item
  @serial_receiving = make Serial_receiving_transaction , :title => @marc_editor.title ,:search_conditions => "Title" , :line_level => 0 ,
                           enum_and_chron_collection:[(make Add_enum_and_chronology , :enum_level1 => "3",:enum_level2 => "4", :chron_level1 => "1991" , :chron_level2 => "Nov" ,:condition => "special_issue"),
                                                      (make Add_enum_and_chronology , :enum_level1 => "5",:enum_level2 => "6", :chron_level1 => "2015" , :chron_level2 => "Nov",:condition => "special_issue")]
  @serial_receiving.create_serial_receiving_transaction
  @serial_receiving.add_enum_and_chron_collection
  @serial_receiving.delete_enum_and_chron_collection
end

Then(/^the removed special issues information should  no longer exists$/) do
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
    enumeration = page.enum_values
    puts enumeration
    @issue_notes =  @serial_receiving.enumeration
    puts "note---->#@issue_notes"
    page.enum_values.should_not  == @serial_receiving.enumeration
    page.windows[1].close
  end
end