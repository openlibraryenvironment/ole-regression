When(/^I link to the existsing E-Holdings to the E-Resource document$/) do

  @marc_editor = make Marc_editor , :item_barcode => uniq_number  ,:title => uniq_alphanums
  @marc_editor.create_bib
  @eresource = make EResourceDocument ,:line_level => 1
  @eresource.create_e_resource_document
  @eresource.create_e_instance
  @linkink_e_holding = make Linking_e_holding_with_e_resource_dataobject , :title => @marc_editor.title
  @linkink_e_holding.create_e_holding_with_existing_bib

end

Then(/^the E-Holding informations should be displayed in E-resource document$/) do
  on E_resource do |page|
    saved = page.doc_status
    puts saved
    page.doc_status.should == "SAVED"
    page.open_e_holding
    sleep(5)
    page.e_holding_title.should == @marc_editor.title
    page.windows[2].close
    page.windows[1].close
  end
end