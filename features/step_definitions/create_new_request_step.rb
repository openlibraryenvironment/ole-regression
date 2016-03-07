Given(/^I am log-in with ole-quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I give request type patron and item informations in request screen$/) do
  puts "enter in to when step"
  @create_patron = create PatronObject , :patron_barcode => uniq_alphanums
  @patron = create PatronObject , :patron_barcode => uniq_alphanums
  @checkout = make CheckoutDataobject  , :item_barcode => uniq_number
  @checkout.create_an_item(@patron.patron_barcode)
  @create_request = make Create_new_request_dataobject , :patron_barcode => @create_patron.patron_barcode , :item_barcode => @checkout.item_barcode
  @create_request.create_request
  @create_request.request_search
end

Then(/^the request should be created successfully$/) do
  on Create_new_request_page do |page|
    page.request_item_barcode.should == @checkout.item_barcode
    page.search_request_type.should == "Recall/Delivery Request"
    puts "Request created successfully."
  end
end