class Requisition < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :status,
                :room_no,
                :vendor,
                :tag,
                :title,
                :location,
                :list_price,
                :acc_code,
                :acc_number,
                :object_code,
                :purchase_order_number

  def initialize(browser , opts={})
    @browser = browser

    defaults = {
        loan_item_barcode: 0,
        room_no: '001',
        vendor: 'ybp',
        tag: '245',
        title: 'Best Laid Plans',
        location: 'API',
        list_price: '10',
        acc_code: 'BL',
        acc_number: '0212009',
        object_code: '2100'

    }
    set_options(defaults.merge(opts))
  end

  def create_requsition
    puts"inside create_requsition..."
    visit CreateReq do |page|
      puts"after visiting the page"
      if(page.open_select_acquire == true)
      page.select_acquire
      end
      page.create_btn
      puts"after selecting Requistion for creation"
      $doc_value = page.doc_no_value
      puts $doc_value
      if page.room.value == ""
        page.address
        page.search_address
        page.return_address
        page.room.set @room_no
      end
      if(page.vendor_tab_open == "open Vendor")
       page.tab_vendor
      end
      page.vendor_alias_name.set @vendor
      page.vendor_select
      page.attachBib
      sleep(3)
      page.createCurrentItemButton
      sleep(10)
      puts"marc editor window 2"
      count=@browser.windows.count
      puts count
      page.windows[1].use
      sleep(5)
      #page.dataField_tag_data.exists?.should be_true
      # page.dataField_tag_data.set @tag
      # page.dataField_tag_id_line0_control.set @title
      page.title.set "|a Best Laid Plans"
      page.submitEditor
      sleep(10)

      page.windows[0].use
      sleep(10)
      page.location.select(@location)
      page.listPrice.set @list_price
      page.addItem
      sleep(5)
      page.windows[1].close
      page.accounting
      page.accountsCode.select(@acc_code)
      page.accountNumber.set @acc_number
      page.financialObjectCode.set @object_code
      page.sourceAnchor

      sleep(10)
      page.institutionalInfo

      sleep(10)
      page.blanketApprove
      sleep(10)

    end
  end

  def get_PO_number
    on CreateReq do |page|
      sleep(10)
      page.doc_search
      sleep(10)
      page.doc_id.set $doc_value
      page.search_req
      sleep(10)
      page.doc_id_link
      sleep(10)
      page.windows[1].use
      page.tab_viewRelatedDocuments
      @purchase_order_number = page.po_number
      puts "po number is #@purchase_order_number"
      sleep(5)
      page.windows[1].close
    end
  end


end