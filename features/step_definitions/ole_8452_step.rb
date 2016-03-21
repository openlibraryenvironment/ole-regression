Given(/^I am log-in with olequickstart$/) do
    log_in("ole-quickstart")
end

When(/^I am returning an item$/) do
  @patron = create PatronObject , :patron_barcode => uniq_alphanums
  @checkout = make CheckoutDataobject  , :item_barcode => uniq_number
  @checkout.create_an_item(@patron.patron_barcode)
  @alterduedate = make RenewDataobject
  @alterduedate.alter_due_date
  @checkin = make Checkin_dataobject , :item_id => @checkout.item_barcode
  @checkin.item_checkin
end

Then(/^the checkin date should be appeared in the item details section of the patron bill$/) do
  on ItemCheckoutAndCkeckin do |page|
    checkin_date = page.checkin_date
    puts Date.parse(DateTime.strptime(checkin_date, '%m/%d/%Y  %H:%M  %p' ).to_s).to_s
    Date.parse(DateTime.strptime(checkin_date, '%m/%d/%Y  %H:%M  %p' ).to_s).to_s.should == Date.today.to_s
  end
end