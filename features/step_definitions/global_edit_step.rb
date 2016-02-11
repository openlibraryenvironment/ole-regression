Given(/^I am logged in as ole-quickstart for global edit$/) do
  log_in("ole-quickstart")
end

When(/^I create multiple item and edit those items$/) do
  @marc_editor1 = make Marc_editor , :item_barcode => uniq_number  ,:title => uniq_alphanums
  @marc_editor1.create_bib
  @marc_editor1.create_holding

  @marc_editor2 = make Marc_editor , :item_barcode => uniq_number  ,:title => uniq_alphanums
  @marc_editor2.create_bib
  @marc_editor2.create_holding

  @edit = make Global_edit_dataobject , :item_title1 => @marc_editor1.title , :item_title2 => @marc_editor2.title
  @edit.global_edit
  @edit.verify_item_locations(@marc_editor1.title , 1)
  @edit.verify_item_locations( @marc_editor2.title , 2)
end

Then(/^the changes should be successfully updated$/) do

  @edit.location1.should == "API"
  @edit.location2.should == "API"

end