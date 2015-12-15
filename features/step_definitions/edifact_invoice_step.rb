Given(/^Logged in with ole-quickstart for InvoiceImport$/) do
 log_in("ole-quickstart")
end

When(/^I tried to load the attached EDIFACT invoice supplied by Harrassowitz$/) do

  @edifact_invoice = make Edifact_invoice_dataobject
  @edifact_invoice.search_vendor_alias_name
  if(@edifact_invoice.vendor_name == "HARRAS")
    @edifact_invoice.set_vendor_alias_name
  else
    puts "Vendor already exists"
  end
  @edifact_invoice.requsition
  @invoiceimport = make BatchProcesses , :file_name => "TestTaxInvoice" , :file_type => "edi"
  @invoiceimport.create_invoice_import
  @edifact_invoice.run_invoice_job

end

Then(/^the invoice should be successfully created and Extended cost,Invoiced price and gross total amount should be same$/) do

  visit Edifact_invoice_page do |page|
    @list_price= 0
    @extended_cost=0
    @total_cost=0
    sleep(10)
    page.doc_search
    sleep(10)
    page.doc_id.set $doc_value
    page.search_req
    sleep(10)
    page.doc_status.should == 'FINAL'
    page.doc_id_link
    sleep(10)
    page.windows[1].use
    page.tab_viewRelatedDocuments
    @purchase_order_number = page.po_number
    puts "po number is #@purchase_order_number"
    page.purchase_order_id_link
    sleep(10)
    page.windows[2].use
    page.purchase_order_status.should == 'FINAL'
    page.invoice_history
    page.open_invoice
    page.windows[3].use
    page.process_item
    sleep(5)
    pos = page.total_pos
    puts pos
    level = 0
    for level in 0 .. pos-1
      if(page.po_id(opts=line_level=level) == @purchase_order_number)
        @list_price = page.list_price(opts=line_level=level)
        @extended_cost = page.extended_cost(opts=line_level=level)
        @total_cost = page.total_cost(opts=line_level=level)
        break
      end
      level+=1
    end
    @list_price.should == "495.00"
    @extended_cost.should == @total_cost
    page.windows[3].close
    page.windows[2].close
    page.windows[1].close
  end
end