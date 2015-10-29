class Create_vendor < DataFactory

  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :description,
                :vendorName,
                :addressTypeCode,
                :lineAddress,
                :cityName,
                :countryCode,
                :document_number,
                :vendor_contact_type_code,
                :formats,
                :transmission_format,
                :transmission_type,
                :vendor_type_code,
                :ownership_code,
                :currency_type,
                :payment_term,
                :payment_method,
                :payment_term_code,
                :supplier_diversity_code,
                :shipping_special_condition,
                :chart_of_accounts,
                :phone_number

  def initialize(browser , opts={})
    @browser = browser
    defaults = {
        addressTypeCode: ["PURCHASE ORDER" , "QUOTE" , "REMIT" ,"RETURN GOODS" , "TAX"].sample,
        cityName: "chennai",
        description: "test",
        countryCode: "India",
        vendor_contact_type_code: ["ACCOUNTS RECEIVABLE","CONTRACT DEVELOPMENT","CUSTOMER SERVICE","INSIDE SALES","PARTS","SERVICE/MAINTENANCE","OUTSIDE SALES","TECHNICAL SUPPORT"].sample,
        formats: ["All","Databases","Ebooks","Journals","Streaming Media"].sample,
        transmission_format: ["EDI","PDF"].sample,
        transmission_type: ["FTP","SFTP","Email","Fax","Mail"].sample,
        vendor_type_code: ["Disbursement Voucher","Purchase Order","Revolving Fund","Participant Payment"].sample,
        ownership_code: ["CORPORATION","ESTATE/TRUST","GOVERNMENT","INDIVIDUAL/SOLE PROPRIETOR","NON-PROFIT","PARTNERSHIP/LLC/LLP"].sample,
        currency_type: "Indian Rupee",
        payment_term_code: "Net 5 Days",
        payment_method: ["Check","Credit Card","Wire Transfer","Cash","Internal Transfer","Foreign Draft","Deposit"].sample,
        supplier_diversity_code: "MBE",
        shipping_special_condition: ["EXPRESS","INSURED"].sample,
        chart_of_accounts: "BL - BLOOMINGTON",
        phone_number: ["FAX","MOBILE","PAGER","PHONE NUMBER","PURCHASE ORDER","TOLL FREE"].sample
    }
    set_options(defaults.merge(opts))
  end

  def create
    visit Vendor_creation do |page|
      page.select_acquire
      page.new_vendor
      @document_number = page.doc_number
      puts "doc number----->#@document_number"
      page.doc_description.set @description
      page.vendor_name.set @vendorName
      page.vendor_type_code.select ("Purchase Order")
      page.vendor_ownership_code.select (@ownership_code)
      page.currency_type_id.select (@currency_type)
      page.payment_term_code.select(@payment_term_code)
      page.payment_method.select(@payment_method)
      add_transmission_format()
      add_address()
      add_contact()
      add_shipping_special_condition()
      add_phone_number()
      add_acquisition_unit()
      #page.non_billable
      page.route
      sleep(10)
    end
  end

  def add_contact()
    on Vendor_creation do |page|
      page.open_contact
      page.contact_type.select(@vendor_contact_type_code)
      page.contact_name.set "John"
      page.format.select(@formats)
      page.add_contacts
    end
  end

  def add_address()
    on Vendor_creation do |pages|
      pages.address_type_code.select("PURCHASE ORDER")
      pages.line_address.set @lineAddress
      pages.city_name.set @cityName
      pages.pin.set "47834"
      pages.country_code.select @countryCode
      pages.default_address.select ("Yes")
      pages.add_address
    end
  end

  def add_transmission_format()
    on Vendor_creation do |page|
      page.transmission_format_id.select(@transmission_format)
      page.transmission_format
      page.transmission_type.select(@transmission_type)
      page.add_transmission_formats
    end
  end

  def add_shipping_special_condition()
    on Vendor_creation do |page|
      page.open_shipping_condition
      page.vendor_shipping_code.select(@shipping_special_condition)
      page.shipping_condition
    end
  end

  def add_acquisition_unit()
    on Vendor_creation do |page|
      page.open_acquisition_unit
      page.vendor_customer_number.set "test"
      page.chart_accounts.select(@chart_of_accounts)
      page.search_account_number_owner
      page.search_acc_no
      page.return_acc_no
      page.add_customer_number
    end
  end

  def add_phone_number()
    on Vendor_creation do |page|
      page.open_phone_number
      page.vendor_phone_type.select("MOBILE")
      page.phone_number.set '012-345-6789'
      page.add_phone_numbers
    end
  end

end