When(/^I removed enumeration and chronology information$/) do

  @marc_editor = make Marc_editor , :item_barcode => uniq_number , :title => uniq_alphanums
  @marc_editor.create_bib
  @marc_editor.create_holding

  @serial_receiving = make Serial_receiving_transaction , :title => @marc_editor.title ,:search_conditions => "Title" , :line_level => 0 ,
                           enum_and_chron_collection:[(make Add_enum_and_chronology , :enum_level1 => "3",:enum_level2 => "4", :chron_level1 => "1991" , :chron_level2 => "Nov" , :condition => "receive"),
                                                      (make Add_enum_and_chronology , :enum_level1 => "5",:enum_level2 => "6", :chron_level1 => "2015" , :chron_level2 => "Nov" , :condition => "receive")]
  @serial_receiving.create_serial_receiving_transaction
  @serial_receiving.add_enum_and_chron_collection
  @serial_receiving.delete_enum_and_chron_collection
end

Then(/^the deleted informations should no longer exists$/) do
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
    page.rows.should == 1
    @enum = page.enum_values
    @chron = page.chron_values
    puts "#@enum"
    puts"#@chron"
    page.enum_values.should_not  == @serial_receiving.enumeration
    page.chron_values.should_not == @serial_receiving.chronology
    page.windows[1].close
  end
end