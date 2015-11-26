class CheckoutDataobject < DataFactory

  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :item_barcode,
                :circulation_desk,
                :patron_id,
                :title,
                :location,
                :item_type,
                :callnumber_type,
                :note,
                :status,
                :proxy


  def initialize (browser , opts={})
    @browser = browser
    default = {
        circulation_desk: "BL_EDUC",
        title: "test",
        location: "B-EDUC/BED-STACKS",
        item_type: "Book",
        callnumber_type: "Library of Congress Classification (LCC)",
        note: "testing",
        status: 'LOANED',
        proxy: "false"
    }
    set_options(default.merge(opts))
  end

  def create_an_item patron_barcode
    visit ItemCheckoutAndCkeckin do |page|
      page.deliver
      page.loan
      if(page.circ_desk_val != "1")
        page.select_circ_desk.select(@circulation_desk)
        page.circ_desk_button
        sleep(5)
      end
      page.patron_barcode.set patron_barcode
      page.send_keys :enter
      if(proxy == "true")
        page.select_proxy
        page.proceed_with_proxy
      end
      page.fast_add_item
      page.item_title.set @title
      page.shelving_location.set @location
      page.item_barcode.set @item_barcode
      page.item_type.select(@item_type)
      page.call_number_type.select(@callnumber_type)
      page.checkin_note.set @note
      page.click_submit
      sleep(5)
      # due_date = (Date.today+10).strftime("%m/%d/%Y")
      # page.select_due_date.set due_date
      # page.due_date_button
      sleep(5)
    end
  end


  def check_inactive_patron patron_barcode

    visit ItemCheckoutAndCkeckin do |page|
      page.deliver
      page.loan
      if(page.circ_desk_val != "1")
        page.select_circ_desk.select(@circulation_desk)
        page.circ_desk_button
        sleep(5)
      end
      sleep(5)
      page.patron_barcode.set patron_barcode
      page.send_keys :enter
      sleep(5)
    end

  end
end