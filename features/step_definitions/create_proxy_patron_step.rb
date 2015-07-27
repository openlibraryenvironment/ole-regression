
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
    page.search
    sleep(10)
    @patronstatus = page.patronstatus
    puts "Patron is #@patronstatus"
    page.patronstatus.should == 'FINAL'
    page.open_patron
    sleep(10)
    page.windows[1].use
    page.open_proxypatron
    sleep(5)
    @proxypatron_barcode = page.proxypatron_barcode
    puts "proxy patron barcode while search #@proxypatron_barcode"
    page.proxypatron_barcode.should == @proxy_patron_barcode
    sleep(5)

  end
end

