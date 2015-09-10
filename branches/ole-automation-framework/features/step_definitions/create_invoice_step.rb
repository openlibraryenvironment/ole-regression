Given(/^I am logged in as an acquisition staffs$/) do
  log_in("ole_quickstart")
end


When(/^I create an  invoice using a purchase order$/) do
  @requisition = make Requisition
  @requisition.create_requsition_for_invoice
  @requisition.get_PO_number

  @invoice = make Invoice , :purchase_order_id => @requisition.purchase_order_number
  @invoice.create_invoice
end

Then(/^a invoice should be successfully created with status as FINAL$/) do
  visit CreateReq do |page|
    sleep(10)
    page.doc_search
    sleep(10)
    page.doc_id.set @purchase_order_Doc_id
    sleep(5)
    page.search_req
    sleep(10)
    @doc_status= page.doc_status
    @doc_status.should == 'PROCESSED'
    sleep(10)
    page.doc_id_link
    sleep(10)
    page.windows[2].use
    page.tab_viewRelatedDocuments
    page.purchase_order_id_link
    sleep(10)
    page.windows[3].use
    @purchase_order_status= page.purchase_order_status
    @purchase_order_status.should match 'FINAL'
    puts "after matching the invoice status..."
    page.windows[1].close
    page.windows[2].close
  end
end