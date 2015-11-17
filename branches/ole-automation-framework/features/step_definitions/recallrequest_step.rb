Given(/^I logged in with ole_quickstart$/) do
  log_in("ole_quickstart")
end

When(/^I'm raising the recall request$/) do
  @patron = create PatronObject , :patron_barcode => uniq_alphanums
  @request_patron = create PatronObject , :patron_barcode => uniq_alphanums
  @checkout = make CheckoutDataobject  , :item_barcode => uniq_number
  @checkout.create_an_item(@patron.patron_barcode)

  @item = make ItemObject
  @item.item_search(@checkout.item_barcode)
  @item.place_request(@request_patron.patron_barcode)

end

Then(/^The request type should be RecallDeliverRequest$/) do

  visit RecallRequest do |page|
    page.deliver
    page.request_search
    page.item_Id_control.set @checkout.item_barcode
    sleep(5)
    page.search_request
    sleep(10)
    page.recallrequest_type.should == 'Recall/Delivery Request'
    puts "Recall/Delivery Request created successfully"
  end
end

When(/^I'm setting pick up location$/) do
  @patron = create PatronObject , :patron_barcode => uniq_alphanums
  @request_patron = create PatronObject , :patron_barcode => uniq_alphanums
  @checkout = make CheckoutDataobject  , :item_barcode => uniq_number
  @checkout.create_an_item(@patron.patron_barcode)

  @pick_up_location = create Circulation_desk

  @deliver_item = make ItemObject
  @deliver_item.item_search (@checkout.item_barcode)
  @deliver_item.recall_hold_request(@request_patron.patron_barcode)

end

Then(/^The request type should be RecallHoldRequest$/) do

  visit RecallRequest do |page|
    page.deliver
    page.request_search
    page.item_Id_control.set @checkout.item_barcode
    sleep(5)
    page.search_request
    sleep(10)
    page.recallrequest_type.should == "Recall/Hold Request"
    puts "Recall/Hold Request created successfully"
  end
end





