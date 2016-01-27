When(/^I checkout an item with proxy patron and try to renew that item$/) do
  @fixed_duedate = make Fixed_due_date_dataobject , :from_date => "01/27/2016" , :to_date => "02/28/2016" , :fixed_due_date => "02/29/2016"
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
      puts "#@fixed_due_date"
      puts Date.parse(DateTime.strptime("#@duedate","%m/%d/%Y  %H:%M  %p").to_s).to_s
      @date = Date.parse(DateTime.strptime("#@fixed_due_date","%m/%d/%Y").to_s).to_s.next
      if(@date == "2016-02-30")
        @date = "2016-03-01"
        puts @date
      end
      Date.parse(DateTime.strptime("#@duedate","%m/%d/%Y  %H:%M  %p").to_s).to_s.should == @date
      puts "Item renewal done successfully"
  end
end