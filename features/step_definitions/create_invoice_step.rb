Given(/^I am logged in as an acquisition staffs$/) do
  log_in("ole_quickstart")
end


When(/^I create an  invoice using a purchase order$/) do
  create_invoice
end

Then(/^a invoice should be successfully created with status as FINAL$/) do
  search_purchase_order_status
end