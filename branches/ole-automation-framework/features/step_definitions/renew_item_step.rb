Given(/^I Logged in as ole-quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I altered the due date for loaned item$/) do

  @patron_object_for_loan = create PatronObject , :patron_barcode => uniq_alphanums

  @loaning = make CheckoutWithPatron ,:item_barcode => uniq_number
  @loaning.checkout_item(@patron_object_for_loan.patron_barcode)

  @renew_item = create Loan , :item_barcode => @loaning.item_barcode
end

Then(/^The due date should be updated$/) do
  #@renew_item.validate_due_date

    on CheckOut_Item do |page|
      @due_date = page.get_due_date
      puts "Item due date after renewal #@due_date"
      Date.parse(DateTime.strptime("#@due_date","%m/%d/%Y  %H:%M  %p").to_s).to_s == Date.parse((DateTime.now + 10).to_s).to_s
    end
  end



