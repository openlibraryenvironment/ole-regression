class ItemObject < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :barcode,
                :recall_deliver_request,
                :recall_holdrequest


  def initialize(browser , opts={})
    @browser = browser

    defaults = {
        barcode: '644',
        recall_deliver_request: "Recall/Delivery Request",
        recall_holdrequest: "Recall/Hold Request"
    }
    set_options(defaults.merge(opts))
  end


  def place_request patron_barcode
    on RecallRequest do |page|
      page.open_request
      page.place_request
      page.windows[1].use
      page.patron_detail.set patron_barcode
      page.send_keys :enter
      page.conform_patron
      page.check_recall
      page.request_submit
      sleep(10)
      page.windows[1].close
    end
  end



  def item_search item_id
    visit RecallRequest do |page|
      page.deliver
      page.item_search
      page.item_id.set item_id
      page.click_item_search
      sleep(5)
    end
  end

  def recall_hold_request patron_barcode
    on RecallRequest do |page|
      page.open_request
      page.place_request
      page.windows[1].use
      page.patron_detail.set patron_barcode
      page.send_keys :enter
      page.conform_patron
      page.check_recall
      sleep(5)
      page.set_pickup_location
      sleep(5)
      page.request_submit
      sleep(5)
      page.windows[1].close
    end
  end

  def hold_hold_request patron_barcode
    on RecallRequest do |page|
      page.open_request
      page.place_request
      page.windows[1].use
      page.patron_detail.set patron_barcode
      page.send_keys :enter
      page.conform_patron
      page.check_hold
      sleep(5)
      page.set_pickup_location
      sleep(5)
      page.request_submit
      sleep(5)
      page.windows[1].close
    end
  end

  def onhold_item_recall_hold_request patron_barcode
    on RecallRequest do |page|
      page.place_request
      page.windows[1].use
      page.patron_detail.set patron_barcode
      page.send_keys :enter
      page.conform_patron
      page.check_recall
      sleep(5)
      page.set_pickup_location
      sleep(5)
      page.request_submit
      sleep(5)
      page.windows[1].close
    end
  end




end