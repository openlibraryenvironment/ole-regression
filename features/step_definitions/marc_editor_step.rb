Given(/^I logged in with username ole-quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I give bib,holding,item informations and open the item in search workbench$/) do
  @marc_editor = make Marc_editor , :item_barcode => uniq_number  ,:title => uniq_alphanums
  @marc_editor.create_bib
  @marc_editor.create_holding
  @marc_editor.search_item
end

Then(/^the opened item local id should be equal to created item local id$/) do
  on Search_workbench do |page|
    page.data_field
    page.windows[1].use
    @id = page.search_local_id
    puts "search workbench item local id --->#@id"
    @marc_editor.item_id.should == @id
    puts "Item created Successfully"
    page.windows[1].close
  end
end
