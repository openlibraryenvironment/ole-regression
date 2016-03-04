class Create_new_request_dataobject < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :patron_barcode,
                :item_barcode

  def initialize(browser , opts={})
    @browser = browser
    defaults={

    }
    set_options(defaults.merge(opts))

  end

  def create_request
    visit Create_new_request_page do |page|
      page.create_new_request
      page.request_type.select("Recall/Delivery Request")
      page.search_patron
      page.request_patron_barcode.set @patron_barcode
      page.request_patron_search
      page.return_patron_barcode
      sleep(5)
      page.search_item_id
      page.item_barcode.set @item_barcode
      page.item_search
      page.return_item
      sleep(5)
      page.submit_request
      sleep(5)
    end
  end

  def request_search
    visit Create_new_request_page do |page|
      page.request_search
      page.pat_barcode.set @patron_barcode
      page.search_request
    end
  end
end