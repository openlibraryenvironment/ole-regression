Given(/^I am log-in as ole-quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I add fines to proxy patron$/) do
  @proxy = create PatronObject , :patron_barcode => uniq_alphanums
  @patron_with_proxy = make PatronObject , :patron_barcode => uniq_alphanums , :proxy_patron_barcode => @proxy.patron_barcode
  @patron_with_proxy.create_patron_with_proxy
  @patron_amount = "100"
  @proxy.create_patron_bill(@patron_amount,@patron_with_proxy.patron_barcode)
  @inactive_patron = make CheckoutDataobject
  @inactive_patron.check_inactive_patron (@proxy.patron_barcode)
  @inactive_patron.check_proxy_patron
end

Then(/^the fines info should come after the proxy patron pop up in loan screen$/) do
  on ItemCheckoutAndCkeckin do |page|
    @message = page.message
    puts "#@message"
    @message.should == "Patron's overall charges are $50 or more"
    sleep(5)
    page.do_not_loan_button
    sleep(5)
  end
end