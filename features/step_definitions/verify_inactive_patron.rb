Given(/^A Patron barcode who is inactive$/)do
  log_in("ole_quickstart")
end

When(/^I scan$/) do
  check_inactive_patron()
end

Then(/^Operator is presented with a pop-up message to allow or disallow loaning of an item$/)do
  verify_patron_message
end
