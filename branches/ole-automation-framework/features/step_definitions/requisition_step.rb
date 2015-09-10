Given(/^I am logged in as an acquisition staff$/) do
  puts"executing Given step of requisition creation"
  log_in("ole_quickstart")
  puts"finished Given step of requisition creation"
end


When(/^I initiate a requisition document$/) do
  puts"executing when step of requisition creation"
  @requisition = make Requisition
  @requisition.create_requsition
  puts"finished when step of requisition creation"
end


Then(/^a requisition should be successfully created$/) do
  visit CreateReq do |page|
    sleep(10)
    page.doc_search
    sleep(10)
    page.doc_id.set $doc_value
    page.search_req
    sleep(10)
    page.doc_status.should == 'FINAL'
    page.doc_id_link
    sleep(10)
    page.windows[2].use
    page.tab_viewRelatedDocuments
    @purchase_order_number = page.po_number
    puts "po number is #@purchase_order_number"
    page.purchase_order_id_link
    sleep(10)
    page.windows[3].use
    page.purchase_order_status.should == 'FINAL'

  end
end


