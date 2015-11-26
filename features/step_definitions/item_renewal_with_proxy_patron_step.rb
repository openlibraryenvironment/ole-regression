When(/^I checkout an item with proxy patron and try to renew that item$/) do
  @fixed_duedate = make Fixed_due_date_dataobject , :from_date => "11/01/2015" , :to_date => "11/29/2015" , :fixed_due_date => "11/30/2015"
  @fixed_duedate.set_fixed_due_date

  @proxy = create PatronObject , :patron_barcode => uniq_alphanums
  @patron_with_proxy = make PatronObject , :patron_barcode => uniq_alphanums , :proxy_patron_barcode => @proxy.patron_barcode
  @patron_with_proxy.create_patron_with_proxy

  @checkout = make CheckoutDataobject  , :item_barcode => uniq_number , :proxy => "true"
  @checkout.create_an_item(@proxy.patron_barcode)



  @renew = make RenewDataobject , :item_id => @checkout.item_barcode
  @renew.item_renewal
end

Then(/^the item due date should be updated successfully$/) do

  on ItemCheckoutAndCkeckin do |page|
    @duedate = page.duedate
    puts "#@duedate"
    @fixed_due_date = (@fixed_duedate.due_date)
    puts Date.parse(DateTime.strptime("#@duedate","%m/%d/%Y  %H:%M  %p").to_s).to_s
    puts Date.parse(DateTime.strptime("#@fixed_due_date","%m/%d/%Y").to_s).to_s.next
    Date.parse(DateTime.strptime("#@duedate","%m/%d/%Y  %H:%M  %p").to_s).to_s.should == Date.parse(DateTime.strptime("#@fixed_due_date","%m/%d/%Y").to_s).to_s.next
    puts "Item renewal done successfully"
  end

end