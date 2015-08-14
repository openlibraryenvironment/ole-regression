# Helper methods that don't properly belong elsewhere. This is
# a sort of "catch all" Module.
#!/usr/bin/env ruby
#encoding : utf-8
#require 'abc'


module Workflows
  @@status="null"




  def initialize(browser , opts={})
    @browser = browser

    defaults = {
        loan_item_barcode: 0
    }
    set_options(defaults.merge(opts))
  end

  def log_in(username)

    visit OLELoginPage do |page|
      # page.cookies.clear
      # sleep(20)
      page.ole_login.set username
    end
  end

  def uniq_alphanums
    @currenttime = DateTime.now
    @day = @currenttime.strftime("%d")
    @month = @currenttime.strftime("%b")
    @hour = @currenttime.strftime("%H")
    @min = @currenttime.strftime("%M")
    @sec = @currenttime.strftime("%S")
    @year = @currenttime.strftime("%Y")
    @day+@month+@year+@hour+@min+@sec
  end

  def uniq_number
    @currenttime = DateTime.now
    @day = @currenttime.strftime("%d")
    @month = @currenttime.strftime("%m")
    @hour = @currenttime.strftime("%H")
    @min = @currenttime.strftime("%M")
    @sec = @currenttime.strftime("%S")
    @year = @currenttime.strftime("%Y")
    @day+@month+@year+@hour+@min+@sec
  end


  def create_requsition()
    visit CreateReq do |page|

      page.select_acquire.click
      page.create_btn.click


      @doc_value = page.doc_no_value
      puts @doc_value
      if page.room.value == ""
        page.address
        page.search_address
        page.return_address
        page.room.set '001'
      end
      page.tab_vendor.click
      page.vendor_alias_name.set 'ybp'
      page.vendor_select.click
      page.attachBib.click
      sleep(3)
      page.createCurrentItemButton.click
      sleep(10)
      page.windows[1].use
      sleep(5)
      page.dataField_tag_data.exists?.should be_true
      page.dataField_tag_data.set '245'
      page.dataField_tag_id_line0_control.set 'Best Laid Plans'
      page.submitEditor.click
      sleep(10)

      page.windows[0].use
      sleep(10)
      page.location.select("API")
      page.listPrice.set "10"
      page.addItem.click

      page.accounting.click
      page.accountsCode.select("BL")
      page.accountNumber.set "1031400"
      page.financialObjectCode.set "2100"
      page.sourceAnchor.click

      sleep(10)
      page.institutionalInfo.click

      sleep(10)
      page.blanketApprove.click
      sleep(10)

    end
  end

  def search_created_req()

    visit CreateReq do |page|

      sleep(10)
      page.doc_search.click
      sleep(10)
      page.doc_id.set @doc_value
      page.search_req.click
      sleep(10)
      @doc_status= page.doc_status
      @doc_status.should == 'FINAL'
      page.doc_id_link.click
      sleep(10)
      page.windows[2].use
      page.tab_viewRelatedDocuments.click
      $purchase_order_number = page.po_number
      puts "po number is #$purchase_order_number"
      page.purchase_order_id_link.click
      sleep(10)
      page.windows[3].use

      @purchase_order_status= page.purchase_order_status
      @purchase_order_status.should == 'FINAL'

    end

  end

  # Creates a req and gets the purchase order number to initiate an Invoice
  def create_invoice
    visit CreateReq do |page|

      page.select_acquire.click
      page.create_btn.click

      @doc_value = page.doc_no_value
      puts @doc_value
      if page.room.value == ""
        page.address
        page.search_address
        page.return_address
        page.room.set '001'
      end
      page.tab_vendor.click
      page.vendor_alias_name.set 'ybp'
      page.vendor_select.click
      page.attachBib.click
      sleep(3)
      page.createCurrentItemButton.click
      sleep(10)
      page.windows[1].use
      sleep(5)
      page.dataField_tag_data.exists?.should be_true
      page.dataField_tag_data.set '245'
      page.dataField_tag_id_line0_control.set 'Best Laid Plans'
      page.submitEditor.click
      sleep(10)

      page.windows[0].use
      sleep(10)
      page.location.select("API")
      page.listPrice.set "10"
      page.addItem.click
      sleep(10)
      page.accounting.click
      sleep(5)
      page.accountsCode.select("BL")
      page.accountNumber.set "1031400"
      page.financialObjectCode.set "2100"
      page.sourceAnchor.click

      sleep(10)
      page.institutionalInfo.click

      sleep(10)
      page.blanketApprove.click
# Navigate to the Doc Search screen to fetch the purchase order
      sleep(20)
      page.doc_search.click
      sleep(10)
      page.doc_id.set @doc_value
      sleep(10)
      page.search_req.click
      sleep(10)
# @doc_status= page.doc_status
# @doc_status.should match 'FINAL'
      page.doc_id_link.click
      sleep(10)
      page.windows[2].use
      page.tab_viewRelatedDocuments.click
      page.purchase_order_id_link.click
      sleep(10)
      page.windows[3].use
# @purchase_order_status= page.purchase_order_status
# @purchase_order_status.should match 'FINAL'
      @purchase_order_id= page.purchase_order_id
      puts @purchase_order_id
      page.windows[1].close
      page.windows[2].close
# page.windows[3].use
# page.windows[3].close
      page.windows[0].use
      page.select_acquire_red.click
      page.create_invoice_btn.click
      sleep(10)
      puts "Create Invoice Process Started"
      puts "Seleting Vendor"
      page.vendor_select_invoice_page.select 'YBP Library Services'
      sleep(5)
      puts "Setting Invoice Date"
      page.invoice_date.set '05/10/2015'
      puts "Setting Invoice Amount"
      page.invoice_amount.set '10'
      sleep(5)
      page.payment_method.select 'Check'
      sleep(5)
      page.process_item_link.click
      sleep(10)
      puts "Searching purchase order"
      page.purchase_order_search.set @purchase_order_id
      sleep(10)
      page.send_keys :enter
      sleep(10)
      puts "Adding purchase order"
      page.add_po.click
      sleep(5)
      page.blanketApprove_invoice
      sleep(30)
    end
  end

  def search_purchase_order_status()
    visit CreateReq do |page|
      sleep(25)
      page.doc_search.click
      sleep(25)
      page.doc_id.set @purchase_order_Doc_id
      sleep(25)
      page.search_req.click
      sleep(30)
      @doc_status= page.doc_status
      @doc_status.should == 'PROCESSED'
      sleep(10)
      page.doc_id_link.click
      sleep(10)
      page.windows[2].use
      page.tab_viewRelatedDocuments.click
      page.purchase_order_id_link.click
      sleep(10)
      page.windows[3].use
      @purchase_order_status= page.purchase_order_status
      @purchase_order_status.should == 'FINAL'
    end
  end
end