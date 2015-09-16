When(/^I give valid item barcode to checkin that item$/) do
  @patron = create PatronObject , :patron_barcode => uniq_alphanums ,:env => "dev"
  @checkout = make CheckoutDataobject  , :item_barcode => uniq_number
  @checkout.create_an_item(@patron.patron_barcode)

  @checkin = make Checkin_dataobject , :item_id => @checkout.item_barcode
  @checkin.item_checkin
end

Then(/^the item status should be recently returned$/) do
  on ItemCheckoutAndCkeckin do |page|
    page.return_status.should == "RECENTLY-RETURNED"
    puts "Item status is recently returned"
  end
end