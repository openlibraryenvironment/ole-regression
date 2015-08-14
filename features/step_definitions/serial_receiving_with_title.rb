When(/^I search item record using title and start creating serial receiving transaction$/) do

  @new_patron = create PatronObject , :patron_barcode => uniq_alphanums
  @loan = make CheckoutWithPatron ,:item_barcode => uniq_number ,:title => uniq_alphanums
  @loan.checkout_item(@new_patron.patron_barcode)

  @serial_receiving = make Serial_receiving_transaction , :title => @loan.title ,:search_conditions => "Title" , :line_level => 0
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
    sleep(10)
    saved = page.doc_status
    puts saved
    page.doc_status.should == "SAVED"

  end
end
