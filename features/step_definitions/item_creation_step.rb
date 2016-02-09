Given(/^Logged in with ole-quickstart for create an item$/) do
    log_in("ole-quickstart")
end

When(/^I give all required values to create an item$/) do
  @item = make CheckoutDataobject , :item_barcode => uniq_number
  @item.create_item
end

Then(/^the item should be created successfully$/) do
  visit ItemCheckoutAndCkeckin do |page|
    page.search_workbench
    page.document_search.select("Item")
    page.search_conditions.set @item.item_barcode
    page.search_item
    sleep(5)
    page.itemStatus.should == "AVAILABLE"
  end
end