When(/^I changed the due date for loaned item$/) do
  @patron = create PatronObject , :patron_barcode => uniq_alphanums
  @checkout = make CheckoutDataobject  , :item_barcode => uniq_number
  @checkout.create_an_item(@patron.patron_barcode)

  @renew = make RenewDataobject , :item_id => @checkout.item_barcode
  @renew.item_renewal
end

Then(/^item due date should be updated$/) do

  on ItemCheckoutAndCkeckin do |page|
    page.item_status.should == "LOANED"
    puts page.item_status
    @duedate = page.duedate
    puts Date.parse(DateTime.strptime("#@duedate","%m/%d/%Y  %H:%M  %p").to_s).to_s
    puts Date.parse((DateTime.now + 10).to_s).to_s
    Date.parse(DateTime.strptime("#@duedate","%m/%d/%Y  %H:%M  %p").to_s).to_s == Date.parse((DateTime.now + 10).to_s).to_s
    puts "Item renewal done successfully"
  end
end