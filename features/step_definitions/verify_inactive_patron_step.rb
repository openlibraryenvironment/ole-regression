Given(/^A patron barcode who is inactive$/)do
  log_in("ole_quickstart")
end

When(/^I scan for patron barcode$/) do
  barcode = random_alphanums(5)
  @patron = make PatronObject , :patron_barcode => uniq_alphanums
  @patron.inactive_patron
  @inactive_patron = make CheckoutWithPatron
  @inactive_patron.check_inactive_patron (@patron.patron_barcode)
end

Then(/^Operator is presented with a pop-up message to allow or disallow loaning of an item$/)do
  #@inactive_patron.verify_patron_message
  on CheckOut_Item do |page|
    sleep(10)
    puts page.patron_message
    page.patron_message.should match /\d.\sThis patron\Ws record has been marked inactive. Do you want to continue\W/
    sleep(5)
  end
end
