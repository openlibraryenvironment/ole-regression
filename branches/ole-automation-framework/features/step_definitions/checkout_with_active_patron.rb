Given(/^A patron barcode who is active$/)do
  log_in("ole_quickstart")
end

When(/^I scan patron barcode for checkOut an item/)do
  checkout_item()
end

Then(/^Item status should be LOANED$/)do
  check_item_status()
end