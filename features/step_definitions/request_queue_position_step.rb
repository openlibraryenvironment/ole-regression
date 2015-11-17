Given(/^Logged in with ole-quickstart to check request queue position$/) do
  log_in("ole-quickstart")
end

When(/^I create hold-hold request and return that item$/) do

  @patron = create PatronObject , :patron_barcode => uniq_alphanums
  @request_patron1 = create PatronObject , :patron_barcode => uniq_alphanums
  @request_patron2 = create PatronObject , :patron_barcode => uniq_alphanums

  @checkout = make CheckoutDataobject  , :item_barcode => uniq_number
  @checkout.create_an_item(@patron.patron_barcode)

  @pick_up_location = create Circulation_desk , :circulationdesk_code => 'UC_JRLMAIN'

  @item = make ItemObject
  @item.item_search(@checkout.item_barcode)
  @item.hold_hold_request(@request_patron1.patron_barcode)

  @checkin = make Checkin_dataobject , :item_id => @checkout.item_barcode
  @checkin.checkin_with_different_location

end

And(/^I create recall-hold request for the same item which is in ONHOLD status$/) do

  @parameter = make Parameters_dataobject
  @parameter.recall_hold_item

  # @request_search = make Request_search_dataobject ,:patron_barcode => @request_patron2.patron_barcode , :item_barcode => @checkout.item_barcode
  # @request_search.create_recall_hold_request

  @item.item_search(@checkout.item_barcode)
  @item.onhold_item_recall_hold_request(@request_patron2.patron_barcode)

  @request_reorder = make RequestReorderDataobject
  @request_reorder.request_reorder(@checkout.item_barcode)

end

Then(/^the request queue position should be 1 for hold-hold and 2 for recall-hold$/) do

  on RequestReorderPage do|page|
    page.request_type(opts=line_level=0).should == "Hold/Hold Request"
    page.request_queue(opts=line_level=0).should == "1"
    page.request_type(opts=line_level=1).should == "Recall/Hold Request"
    page.request_queue(opts=line_level=1).should == "2"
    puts "hold request is in its queue position when the item status is ONHOLD."
  end
end