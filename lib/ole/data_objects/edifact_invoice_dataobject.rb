class Edifact_invoice_dataobject < DataFactory

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
                :purchase_order_number,
                :vendor_exists,
                :vendor_name

  def initialize(browser , opts={})
    @browser = browser

    defaults = {
        loan_item_barcode: 0,
        room_no: '001',
        vendor: 'OH',
        tag: '245',
        title: 'Best Laid Plans',
        location: 'API',
        list_price: '10',
        acc_code: 'BL',
        acc_number: '1031400',
        object_code: '2100'

    }
    set_options(defaults.merge(opts))
  end

  def search_vendor_alias_name
    visit Edifact_invoice_page do |page|
      page.select_acquire
      page.vendor_search
      page.vendor_name.set '*HARRA*'
      page.vendorsearch

      if(page.check_vendor_alias == "HARRAS")
        @vendor_name="HARRAS"
      end
    end
  end

  def requsition
    puts"inside create_requsition..."
    visit Edifact_invoice_page do |page|
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
      page.vendor_item_id.set '96460938'
      page.addItem
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

  def set_vendor_alias_name
    on Edifact_invoice_page do |page|
      page.edit_vendor
      page.set_description.set 'test'
      if(page.vendor_varient_tab == "open Variant Name")
        page.open_vendor_varient
      end
      page.alias_name.set'OH'
      page.alias_type.set 'Abbreviation'
      page.add_vendor_alias
      sleep(5)
      page.route
      sleep(5)
    end
  end

  def run_invoice_job
    on Edifact_invoice_page do |page|
      level = 0
      for level in 0 .. 25
        if (page.status == "COMPLETED" || page.status == "STOPPED")
          break
        else
          page.refresh_button
          sleep(5)
        end
      end
      page.per_complete.should == "100.00%"
      page.view_report
      sleep(10)
      page.windows[2].use
      sleep(10)
      page.total_no_of_records.should == page.no_of_success_records
      page.no_of_failure_records.should == "0"
      page.job_status.should == "Invoice Ingest executed successfully."
      puts "Invoice Ingest executed successfully."
      page.windows[2].close
      page.windows[1].close
    end
  end
end