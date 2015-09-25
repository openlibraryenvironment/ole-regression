Given(/^Logged in with ole-quickstart$/)do
  log_in("ole_quickstart")
end

When(/^I give item id for checkin$/) do
  @patron = create PatronObject , :patron_barcode => uniq_alphanums
  @checkout = make CheckoutDataobject  , :item_barcode => uniq_number
  @checkout.create_an_item(@patron.patron_barcode)

  @checkin = make Checkin_dataobject , :item_id => @checkout.item_barcode
  @checkin.item_checkin
end

Then(/^Item status should be Recently Returned$/) do
  on ItemCheckoutAndCkeckin do |page|
    page.return_status.should == "RECENTLY-RETURNED"
    puts "Item status is recently returned"
  end
end
