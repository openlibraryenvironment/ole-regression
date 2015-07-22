Given(/^I am logged in as an acquisition staff$/) do
  log_in("ole_quickstart")

end


When(/^I initiate a requisition document$/) do
  create_requsition()

end


Then(/^a requisition should be successfully created$/) do
  search_created_req()
end


