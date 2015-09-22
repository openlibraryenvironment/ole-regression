Given(/^I'm logged-in with ole-quickstart$/) do
  log_in("ole_quickstart")
end

When(/^I give valid patron barcode for checkOut an item$/) do
  @patron = create PatronObject , :patron_barcode => uniq_alphanums
  @checkout = make CheckoutDataobject  , :item_barcode => uniq_number
  @checkout.create_an_item(@patron.patron_barcode)
end

Then(/^Item status should be loaned$/) do
  on ItemCheckoutAndCkeckin do |page|
    page.item_status.should == "LOANED"
    puts "Item status is loaned"
  end
end
