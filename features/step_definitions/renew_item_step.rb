Given(/^I Logged in as ole-quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I altered the due date for loaned item$/) do
  # fromdate = (Date.parse "#{(Date.today).year}-#{(Date.today).month}-01").strftime("%m/%d/%Y")
  @fixed_duedate = make Fixed_due_date_dataobject , :from_date =>"11/01/2015" , :to_date => "11/30/2015" , :fixed_due_date => "11/25/2015"
  @fixed_duedate.set_fixed_due_date
  @patron = create PatronObject , :patron_barcode => uniq_alphanums
  @checkout = make CheckoutDataobject  , :item_barcode => uniq_number
  @checkout.create_an_item(@patron.patron_barcode)
  @renew = make RenewDataobject , :item_id => @checkout.item_barcode
  @renew.item_renewal
end

Then(/^The due date should be updated$/) do
  on ItemCheckoutAndCkeckin do |page|
    @duedate = page.duedate
    puts "#@duedate"
    @fixed_due_date = (@fixed_duedate.due_date)
    puts "#@fixed_due_date"
    puts Date.parse(DateTime.strptime("#@duedate","%m/%d/%Y  %H:%M  %p").to_s).to_s
    puts Date.parse(DateTime.strptime("#@fixed_due_date","%m/%d/%Y").to_s).to_s.next
    Date.parse(DateTime.strptime("#@duedate","%m/%d/%Y  %H:%M  %p").to_s).to_s.should == Date.parse(DateTime.strptime("#@fixed_due_date","%m/%d/%Y").to_s).to_s.next
    puts "Item renewal done successfully"
  end
end



