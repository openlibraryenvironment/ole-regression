Given(/^I Logged in as ole-quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I altered the due date for loaned item$/) do
  fromdate = (Date.parse "#{(Date.today).year}-#{(Date.today).month}-01").strftime("%m/%d/%Y")
  todate = Date.civil(((Date.today).year),((Date.today).month),-01).strftime("%m/%d/%Y")
  @fixed_duedate = make Fixed_due_date_dataobject , :from_date => fromdate , :to_date => todate , :fixed_due_date => todate
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
    sleep(5)
    @date = Date.parse(DateTime.strptime("#@fixed_due_date","%m/%d/%Y").to_s).to_s
    sleep(5)
    Date.parse(DateTime.strptime("#@duedate","%m/%d/%Y  %H:%M  %p").to_s).to_s.should == @date
    puts "Item renewal done successfully ."
  end
end



