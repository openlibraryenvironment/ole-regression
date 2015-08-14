When(/^I search record using ISSN and start creating serial receiving transaction$/) do
  @new_patron = create PatronObject , :patron_barcode => uniq_alphanums
  @loan = make CheckoutWithPatron ,:item_barcode => uniq_number ,:title => uniq_alphanums
  @loan.checkout_item(@new_patron.patron_barcode)

  @serial_receiving = make Serial_receiving_transaction , :item_identifier => @loan.item_barcode , :doc_type => "Item Barcode" ,:search_conditions => "ISSN" , :line_level => 1 , :tag => "022" ,:issn => uniq_number
  @serial_receiving.search_workbench
  @serial_receiving.create_serial_receiving_transaction
end