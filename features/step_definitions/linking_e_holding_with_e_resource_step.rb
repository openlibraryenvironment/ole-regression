Given(/^logged in with ole-quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I create new E-resource document and adding new E-Holding in to it$/) do
  @eresource = make EResourceDocument , :line_level => 2
  @eresource.create_e_resource_document
  @eresource.create_e_instance
  @einstance = make Linking_e_holding_with_e_resource_dataobject , :title => uniq_alphanums
  @einstance.create_bib
end

Then(/^the added E-Holding should be displayed in E-resource document$/) do
  on E_resource do |page|
    saved = page.doc_status
    puts saved
    page.doc_status.should == "SAVED"
    page.open_e_holding
    sleep(5)

  end
end