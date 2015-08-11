class PatronObject < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows




  attr_accessor :patron_barcode,
                :patron_borrower_type,
                :patron_expiration_date,
                :patron_first_name,
                :patron_last_name,
                :patron_email,
                :patron_address_type,
                :patron_address_source,
                :patron_status,
                :patronstatus,
                :proxy_patron_barcode,
                :proxy_patron_activation_date,
                :proxy_patron_expiration_date,
                :patron_note_text,
                :created_note_text0,
                :created_note_text1,
                :existing_field,
                :deleted_text,
                :count_of_total_notes,
                :remaining_count,
                :patron_feetype,
                :patron_amount



  def generate_random_string(length=6)
    string = ""
    chars = ("a".."z").to_a
    length.times do
      string << chars[rand(chars.length-1)]
    end
    string
  end

  def email
    emailid = (0..8).map{('a'..'z').to_a[rand(26)]}.join+"@yopmail.com"
    return emailid
  end




  def initialize(browser, opts={})
    @browser = browser
    #@patron_barcode = patronbarcode
    #@patron_barcode = Array.new(8){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join
    defaults = {

        #patron_barcode: Array.new(8){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join,
        patron_borrower_type: "UnderGrad",
        patron_expiration_date: "05/26/2070",
        patron_first_name: "Proxy",
        patron_last_name: "Patron",
        patron_email: email,
        patron_address_type: ["Home","Other","Work","Campus"].sample,
        patron_address_source: ["Registrar Load","Master Feed","Operator","Borrower"].sample,
        patron_status: "FINAL",
        proxy_patron_barcode: "1018",
        proxy_patron_activation_date: "11/26/2016",
        proxy_patron_expiration_date: "11/26/2060",
        patron_feetype: ["Overdue Fine","Replacement Fee","Service Fee"].sample,
        patron_amount: '100'



    }
    set_options(defaults.merge(opts))

  end

  def create(opts={})
    on PatronPage do |page|
      page.deliver
      page.patron
      page.create_new
      sleep(3)
      page.overview
      sleep(2)
      puts "patronbarcode is #@patron_barcode"
      page.barcode.set @patron_barcode
      page.borrowertype.select(@patron_borrower_type)
      page.expiration_date.set @patron_expiration_date
      page.contacts
      sleep(2)
      page.first_name.set @patron_first_name
      page.last_name.set @patron_last_name
      page.address_type.select(@patron_address_type)
      page.address_source.select(@patron_address_source)
      page.deliver_address
      page.default_value
      page.activate_address
      page.add_address
      sleep(3)
      page.email.set @patron_email
      page.preferred_email
      page.activate_email_addr
      page.add_email
      sleep(3)
      page.submit
      sleep(5)

    end
  end
  def create_patron_with_proxy
    visit PatronPage do |page|
      page.patron
      sleep(3)
      page.create_new
      sleep(3)
      page.overview
      sleep(2)
      puts "patronbarcode is #@patron_barcode"
      page.barcode.set @patron_barcode
      page.borrowertype.select(@patron_borrower_type)
      page.expiration_date.set @patron_expiration_date
      page.contacts
      sleep(2)
      page.first_name.set @patron_first_name
      page.last_name.set @patron_last_name
      page.address_type.select(@patron_address_type)
      page.address_source.select(@patron_address_source)
      page.deliver_address
      page.default_value
      page.activate_address
      page.add_address
      sleep(3)
      page.email.set @patron_email
      page.preferred_email
      page.activate_email_addr
      page.add_email
      sleep(3)
      page.proxypatron
      sleep(10)
      page.add_proxy_barcode.set @proxy_patron_barcode
      #page.proxy_search_field
      #page.search_proxy
      sleep(5)
      #page.return_proxy
      @proxy_patron_barcode = page.proxy_barcode
      puts "proxy patron barcode while create #@proxy_patron_barcode"
      #page.proxy_activation_date.set @proxy_patron_activation_date
      #page.proxy_expiration_date.set @proxy_patron_expiration_date
      page.add_proxypatron
      page.submit
      sleep(5)
    end
  end

  def create_patron_with_notes
    visit PatronPage do |page|
      page.patron
      sleep(3)
      page.create_new
      sleep(3)
      page.overview
      sleep(2)
      puts "patronbarcode is #@patron_barcode"
      page.barcode.set @patron_barcode
      page.borrowertype.select(@patron_borrower_type)
      page.expiration_date.set @patron_expiration_date
      page.contacts
      sleep(2)
      page.first_name.set @patron_first_name
      page.last_name.set @patron_last_name
      page.address_type.select(@patron_address_type)
      page.address_source.select(@patron_address_source)
      page.deliver_address
      page.default_value
      page.activate_address
      page.add_address
      sleep(3)
      page.email.set @patron_email
      page.preferred_email
      page.activate_email_addr
      page.add_email
      sleep(3)
      page.note
      @notes_collection.each do |notes|
        notes.create
      end
      page.submit
      sleep(5)
      @created_note_text0 = page.note_created_text0
      @created_note_text1 = page.note_created_text1
      sleep(5)
    end
  end

  def edit_patrons
    visit PatronPage do |page|
      page.patron
      sleep(3)
      page.patron_barcode.set @patron_barcode
      page.search_patron_barcode
      page.patron_edit
      sleep(5)
      page.note
      @deleted_text = page.text_deleted
      puts "deleted note text is #@deleted_text"
      sleep(3)
      page.delete_note
      page.submit
      sleep(5)
    end
  end

  def inactive_patron
    on PatronPage do |page|
      page.deliver
      sleep(3)
      page.patron
      sleep(3)
      page.create_new
      sleep(3)
      page.overview
      sleep(2)
      puts "patronbarcode is #@patron_barcode"
      page.barcode.set @patron_barcode
      page.borrowertype.select(@patron_borrower_type)
      page.expiration_date.set @patron_expiration_date
      page.active_indicator
      page.contacts
      sleep(2)
      page.first_name.set @patron_first_name
      page.last_name.set @patron_last_name
      page.address_type.select(@patron_address_type)
      page.address_source.select(@patron_address_source)
      page.deliver_address
      page.default_value
      page.activate_address
      page.add_address
      sleep(3)
      page.email.set @patron_email
      page.preferred_email
      page.activate_email_addr
      page.add_email
      sleep(3)
      page.submit
      sleep(5)

    end
  end

  def create_patron_bill patron_fee_amount

    visit PatronPage do |page|
      page.patron
      sleep(3)
      page.patron_barcode.set @patron_barcode
      page.search_patron_barcode
      page.createbill
      page.windows[1].use
      page.feetype.select(@patron_feetype)
      page.feeamount.set patron_fee_amount
      page.addfee
      sleep(10)
      $fee_amount=page.patron_amount
      page.patron_submit
      sleep(10)
      page.windows[1].close
    end
  end
end

