Given(/^I am logged in as ole-quickstart to transfer item$/) do
    log_in("ole-quickstart")
end

When(/^I create two bibs and select item and holding to transfer$/) do
  @marc_editor1 = make Marc_editor , :item_barcode => uniq_number  ,:title => uniq_alphanums
  @marc_editor1.create_bib
  @marc_editor1.create_holding
  @marc_editor1.create_item

  @marc_editor2 = make Marc_editor , :item_barcode => uniq_number  ,:title => uniq_alphanums
  @marc_editor2.create_bib
  @marc_editor2.create_holding
  @marc_editor2.create_item

  @transfer = make Transfer_item_and_holding_dataobject , :item_title1 => @marc_editor1.title , :item_title2 => @marc_editor2.title
  @transfer.transfer_item_and_holding
end

Then(/^the item should relocate properly$/) do
  visit Transfer_item_and_holding do |page|
    page.search_workbench
    page.search_text.set @marc_editor2.title
    page.search
    sleep(5)
    @val = page.check_title
    puts "title exists --->#@val"
    page.click_title
    sleep(5)
    page.windows[1].use
    sleep(5)
    @title = page.item_after_transfer
    puts "title--->#@title"
    page.item_after_transfer.should == @marc_editor1.item_barcode
    puts "item transfered successfully"
  end
end