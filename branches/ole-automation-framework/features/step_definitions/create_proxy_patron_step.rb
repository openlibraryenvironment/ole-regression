
Given (/^Log in with ole-quickstart$/) do
  log_in("ole-quickstart")
end

When (/^Create new patron with proxypatron$/) do

  @proxy = create PatronObject , :patron_barcode => uniq_alphanums


  @patron_with_proxy = make PatronObject , :patron_barcode => uniq_alphanums , :proxy_patron_barcode => @proxy.patron_barcode
  @patron_with_proxy.create_patron_with_proxy

end



Then (/^Status should be FINAL$/) do

  #@patron_with_proxy.search_proxy_patron
  @proxy_patron_barcode = @proxy.patron_barcode
  visit PatronPage do |page|
    page.doc_search
    sleep(3)
    page.doc_id.set $document_id
    sleep(3)
    page.search
    sleep(10)
    page.open_patron
    sleep(10)
    page.windows[1].use
    saved = page.doc_status
    puts saved
    page.doc_status.should == "FINAL"
    page.open_proxypatron
    sleep(5)
    @proxypatron_barcode = page.proxypatron_barcode
    puts "proxy patron barcode while search #@proxypatron_barcode"
    page.proxypatron_barcode.should == @proxy_patron_barcode
    sleep(5)

  end
end

