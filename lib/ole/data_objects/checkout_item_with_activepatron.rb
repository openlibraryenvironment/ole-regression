class Checkout_item_with_activepatron < DataFactory
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
      page.deliver.click
      page.loan.click
      sleep(5)
      page.circulation_desk.select(@circulation_desk)
      sleep(3)
      page.select_circulation_desk.click
      sleep(5)
      page.set_patron_barcode.set patron_barcode
      page.send_keys :enter
      sleep(5)
      page.fast_add_item.click
      sleep(5)
      page.item_title.set @title
      page.location.set @location
      page.barcode.set @item_barcode
      page.item_type.select(@item_type)
      page.call_number_type.select(@callnumber_type)
      page.checkout_note.set @note
      sleep(5)
      page.submit.click
      sleep(3)
      page.checkout.click
      sleep(5)
      page.send_keys :enter
      sleep(10)
      @status=page.status
      puts "Item status is #@status"
      sleep(3)

    end
  end


  def item_checkin item_barcode
    visit CheckOut_Item do |page|
      page.deliver.click
      page.return.click
      sleep(3)
      page.return_circ_desk.select ("BL_EDUC")
      sleep(3)
      page.change_return_location.click
      sleep(3)
      page.return_item.set item_barcode
      page.send_keys :enter
      sleep(3)
      page.checkin_note.click
      sleep(3)
      @status = page.checkin_status
      puts "Item is #@status"
      sleep(3)

    end
  end



end