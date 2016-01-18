

When(/^I create new E-resource document and linking to the existsing E-Holdings$/) do

  @marc_editor = make Marc_editor , :item_barcode => uniq_number  ,:title => uniq_alphanums
  @marc_editor.create_bib
  @marc_editor.create_e_holding
  @eresource = make EResourceDocument ,:line_level => 0
  @eresource.create_e_resource_document
  @eresource.create_e_instance
  @linkink_e_holding = make Linking_e_holding_with_e_resource_dataobject , :title => @marc_editor.title
  @linkink_e_holding.link_e_holdings


end

Then(/^the E-Holding details should be displayed in E-resource document$/) do
  on E_resource do |page|
    saved = page.doc_status
    puts saved
    page.doc_status.should == "SAVED"
    page.open_e_holding
    sleep(5)
    page.e_holding_title.should == @marc_editor.title
  end
end




