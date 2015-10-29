Given(/^I logged-in with ole-quickstart$/) do
    log_in("ole-quickstart")
end

When(/^I give vendor name , vendor address and save it$/) do
    @vendor = make Create_vendor , :vendorName => uniq_alphanums , :lineAddress => uniq_alphanums
    @vendor.create
end

Then(/^the vendor state should be in saved$/) do
    on Vendor_creation do |page|
      page.doc_search
      sleep(3)
      page.doc_id.set @vendor.document_number
      sleep(3)
      page.search
      sleep(10)
      page.doc_id_link
      page.windows[1].use
      sleep(10)
      saved = page.doc_status
      puts saved
      page.doc_status.should == "FINAL"
      sleep(5)
    end
end