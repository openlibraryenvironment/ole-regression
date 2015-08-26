When(/^I create PO and link it with E-Resource document$/) do
  create_requsition()
  @eresouce = make EResourceDocument , :tab => 'red'
  @eresouce.requisition_local_id
  @identifier = @eresouce.po_identifier
  @eresouce.create_e_resource_document
  @eresouce.search_e_resource
end

Then(/^the created PO id should be equal to linked PO id in the E-Resource document$/) do
  on E_resource do |page|
    page.open_po
    sleep(3)
    page.e_res_po_id.should == @eresouce.po_identifier
    puts @identifier
  end
end