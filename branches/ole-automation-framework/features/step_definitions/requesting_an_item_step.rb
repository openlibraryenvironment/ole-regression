Given(/^I logged in with ole_quickstart$/) do
  log_in("ole_quickstart")
end

When(/^I'm raising the recall request$/) do

  @patron_object = create PatronObject , :patron_barcode => uniq_alphanums
  @patron_barcode_for_loan = create PatronObject , :patron_barcode => uniq_alphanums


  @loan = make Checkout_item_with_activepatron ,:item_barcode => uniq_number
  @loan.checkout_item(@patron_barcode_for_loan.patron_barcode)


  @item = make ItemObject
  @item.search (@loan.item_barcode)
  @item.place_request(@patron_object.patron_barcode)

end

Then(/^The request type should be RecallDeliverRequest$/) do
  @item_id = @loan.item_barcode

    visit RecallRequest do |page|
      page.deliver
      page.request_search
      page.item_Id_control.set @item_id
      sleep(5)
      page.search_request
      sleep(5)
      page.recallrequest_type.should == 'Recall/Delivery Request'
    end
  end


