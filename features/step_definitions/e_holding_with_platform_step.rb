When(/^I create platform and linked to the existsing E-Holdings to the E-Resource document$/) do

  @marc_editor = make Marc_editor , :item_barcode => uniq_number  ,:title => uniq_alphanums
  @marc_editor.create_bib

  @linkink_e_holding = make Linking_e_holding_with_e_resource_dataobject , :title => @marc_editor.title , :platform_name => uniq_alphanums
  @linkink_e_holding.e_holding_platform

  @eresource = make EResourceDocument ,:line_level => 1
  @eresource.create_e_resource_document
  @eresource.create_e_instance

  @linkink_e_holding.create_e_holding_with_existing_bib

end

