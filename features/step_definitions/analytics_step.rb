Given(/^I am logged in as ole-quickstart to do analytics$/) do
  log_in("ole-quickstart")
end

When(/^I create two items and linked into multiple holding$/) do
  @marc_editor1 = make Marc_editor , :item_barcode => uniq_number  ,:title => uniq_alphanums
  @marc_editor1.create_bib
  @marc_editor1.create_holding
  @marc_editor1.create_item

  @marc_editor2 = make Marc_editor , :item_barcode => uniq_number  ,:title => uniq_alphanums
  @marc_editor2.create_bib
  @marc_editor2.create_holding
  @marc_editor2.create_item

  @analytics = make Analytics_dataobject , :item_title1 => @marc_editor1.title , :item_title2 => @marc_editor2.title
  @analytics.create_analytics
  @analytics.check_analytics
end

Then(/^the item should present in both holdings$/) do
  @analytics.analytics_variable.should == "AI"
  @analytics.analytics_item.should == @marc_editor2.item_barcode
end