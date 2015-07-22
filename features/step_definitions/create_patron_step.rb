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
        page.search
        sleep(5)
        @patronstatus = page.patronstatus
        puts "Patron is #@patronstatus"
        page.patronstatus.should == 'FINAL'
        sleep(5)
      end
    end




