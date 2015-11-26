class Request_search_dataobject < DataFactory

  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :request_type,
                :patron_barcode,
                :item_barcode,
                :location

  def initialize(browser,opts={})
    @browser = browser
    defaults = {
        request_type: "Recall/Hold Request",
        location: "UC_JRLMAIN"
    }
    set_options(defaults.merge(opts))
  end

  def create_recall_hold_request
    visit Request_search_page do |page|
      page.deliver
      page.request_search
      page.create_request
      page.request_types.select(@request_type)
      page.patron_barcode.set @patron_barcode
      page.item_barcode.set @item_barcode
      page.pickup_location.select(@location)
      page.submit
      sleep(5)
    end
  end
end