class RequestReorderDataobject < DataFactory

  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  def initialize (browser , opts={})
    @browser = browser
    default = {

    }
    set_options(default.merge(opts))
  end

  def request_reorder item_barcode
    visit RequestReorderPage do |page|
      page.deliver
      page.recall_request
      page.search_item_barcode.set item_barcode
      page.send_keys :enter
      sleep(5)
    end
  end

end