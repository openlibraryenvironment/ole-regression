When(/^I search record using ISSN and start creating serial receiving transaction$/) do
  @marc_editor = make Marc_editor , :item_barcode => uniq_number , :title => uniq_alphanums ,:issn_num => uniq_number
  @marc_editor.create_bib
  @marc_editor.create_holding
  @marc_editor.create_item

  @serial_receiving = make Serial_receiving_transaction , :item_identifier => @marc_editor.item_barcode , :doc_type => "Item Barcode" ,:search_conditions => "ISSN" , :line_level => 1 , :tag => "022" ,:issn => @marc_editor.issn_num
  @serial_receiving.create_serial_receiving_transaction
end