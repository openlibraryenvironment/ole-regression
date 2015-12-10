Given(/^I logged in with ole-quickstart$/) do
  log_in("ole-quickstart")
end

When(/^I give material,format and content type and save the document$/) do
  @eresouce = make EResourceDocument , :tab => 'green'
  @eresouce.create_e_resource_document
end

Then(/^the EResource document should be saved with the status saved$/) do
  visit E_resource do |page|
    page.doc_search
    sleep(3)
    page.doc_id.set $document_id
    page.search_req
    page.doc_id_link
    page.windows[1].use
    sleep(10)
    saved = page.doc_status
    puts saved
    page.doc_status.should == "SAVED"
    page.windows[1].close
  end
end