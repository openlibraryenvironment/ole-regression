class Checkout_with_inactive_patron < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :status

  def initialize(browser, opts={})
    @browser = browser

    defaults = {
    }
    set_options(defaults.merge(opts))
  end

  def check_inactive_patron patron_barcode

    visit CheckOut_Item do |page|
      page.deliver.click
      page.loan.click
      sleep(5)
      page.patron_barcode_control.set patron_barcode
      page.send_keys :enter
      sleep(5)
    end

  end


end