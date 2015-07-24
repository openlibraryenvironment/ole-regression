Given(/^Logged in with ole-quickstart$/)do
  log_in("ole_quickstart")
end

When(/^Get item id for checkin/)do

  @patron_obj = create PatronObject , :patron_barcode => uniq_alphanums
  @loaned = make Checkout_item_with_activepatron ,:item_barcode => uniq_number
  @loaned.checkout_item(@patron_obj.patron_barcode)
  @loaned.item_checkin (@loaned.item_barcode)
end

Then(/^Item status should be Recently Returned/)do
  #@loaned.item_status

    on CheckOut_Item do |page|
      puts "Item is returned"
      page.checkin_status.should == 'Recently Returned'
      sleep(3)
    end
  end