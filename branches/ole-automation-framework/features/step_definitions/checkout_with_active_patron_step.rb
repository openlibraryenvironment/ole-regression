Given(/^A patron barcode who is active$/)do
  log_in("ole_quickstart")
end

When(/^I scan patron barcode for checkOut an item/)do


  @patron = create PatronObject , :patron_barcode => uniq_alphanums


  @loan_item = make Checkout_item_with_activepatron ,:item_barcode => uniq_number
  @loan_item.checkout_item(@patron.patron_barcode)

end

Then(/^Item status should be LOANED$/)do
  #@loan_item.check_item_status()
    on CheckOut_Item do |page|
      puts "Item status is LOANED"
      page.status.should == 'LOANED'
    end
    sleep(5)
  end
