Given(/^A patron barcode who is inactive$/)do
  log_in("ole_quickstart")
end

When(/^I scan for patron barcode$/) do
  barcode = random_alphanums(5)
  @patron = make PatronObject , :patron_barcode => uniq_alphanums
  @patron.inactive_patron
  @inactive_patron = make CheckoutDataobject
  @inactive_patron.check_inactive_patron (@patron.patron_barcode)
end

Then(/^Operator is presented with a pop-up message to allow or disallow loaning of an item$/)do
  #@inactive_patron.verify_patron_message
  on ItemCheckoutAndCkeckin do |page|
    sleep(5)
    page.popup_message.should == "Patron is Inactive"
    puts page.popup_message
    sleep(5)
  end
end
