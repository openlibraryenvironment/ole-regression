Given(/^Log in as ole-quickstart$/) do
  log_in("ole-quickstart")
end

When(/^Create a new patron$/) do

  @create_patron = create PatronObject , :patron_barcode => uniq_alphanums

end


Then(/^Patron status must be FINAL$/) do

  visit PatronPage do |page|
    page.doc_search
    sleep(3)
    page.doc_id.set $document_id
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




