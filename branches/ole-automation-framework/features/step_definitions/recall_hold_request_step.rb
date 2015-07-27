Given(/^I'm log in as ole_quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I'm setting pick up location$/) do

  @patron_request_object = create PatronObject , :patron_barcode => uniq_alphanums
  @patron_object_for_loan = create PatronObject , :patron_barcode => uniq_alphanums

  @loaning = make CheckoutWithPatron ,:item_barcode => uniq_number
  @loaning.checkout_item(@patron_object_for_loan.patron_barcode)

  @pick_up_location = create Circulation_desk

  @deliver_item = make ItemObject
  @deliver_item.item_search (@loaning.item_barcode)
  @deliver_item.recall_hold_request(@patron_request_object.patron_barcode)
end

Then(/^The request type should be RecallHoldRequest$/) do
  #@deliver_item.check_hold_request (@loaning.item_barcode)
  @item_id = @loaning.item_barcode

  visit RecallRequest do |page|
    page.deliver
    page.request_search
    page.item_Id_control.set @item_id
    sleep(5)
    page.search_request
    sleep(10)
    page.recallrequest_type.should == "Recall/Hold Request"
  end
end
