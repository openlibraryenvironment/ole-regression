class CheckoutWithPatron < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :item_barcode,
                :circulation_desk,
                :patron_barcode,
                :title,
                :location,
                :item_type,
                :callnumber_type,
                :note,
                :status

  def initialize(browser, opts={})
    @browser = browser

    defaults = {
        circulation_desk: "BL_EDUC",
        title: "test",
        location: "B-EDUC/BED-STACKS",
        item_type: "Book",
        callnumber_type: "Library of Congress Classification (LCC)",
        note: "testing",
        status: 'LOANED'
    }
    set_options(defaults.merge(opts))
  end


  def checkout_item patron_barcode
    visit CheckOut_Item do |page|
      page.deliver
      page.loan
      page.circulation_desk.select(@circulation_desk)
      page.select_circulation_desk
      sleep(5)
      page.set_patron_barcode.set patron_barcode
      page.send_keys :enter
      page.fast_add_item
      page.item_title.set @title
      page.location.set @location
      page.barcode.set @item_barcode
      page.item_type.select(@item_type)
      page.call_number_type.select(@callnumber_type)
      page.checkout_note.set @note
      page.submit
      sleep(10)
      page.checkout.click
      sleep(10)
      page.send_keys :enter
      sleep(10)
      @status=page.status
      puts "Item status is #@status"
      sleep(3)
    end
  end


  def item_checkin item_barcode
    visit CheckOut_Item do |page|
      page.deliver
      page.return
      sleep(3)
      page.return_circ_desk.select ("BL_EDUC")
      page.change_return_location
      sleep(5)
      page.return_item.set item_barcode
      page.send_keys :enter
      page.checkin_note
      sleep(5)
      @status = page.checkin_status
      puts "Item is #@status"
      sleep(5)

    end
  end

  def check_inactive_patron patron_barcode

    visit CheckOut_Item do |page|
      page.deliver
      page.loan
      sleep(5)
      page.patron_barcode_control.set patron_barcode
      page.send_keys :enter
      sleep(5)
    end

  end



end