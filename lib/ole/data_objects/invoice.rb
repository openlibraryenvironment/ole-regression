class Invoice < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :invoice_date,
                :invoice_amount,
                :payment_method,
                :purchase_order_id

  def initialize(browser , opts={})
    @browser = browser

    defaults = {
        invoice_date: '05/10/2015',
        invoice_amount: '10',
        payment_method: 'Check'
    }
    set_options(defaults.merge(opts))
  end

  def create_invoice
    on CreateReq do |page|

      page.windows[1].close
      page.windows[2].close
# page.windows[3].use
# page.windows[3].close
      page.windows[0].use
      page.select_acquire_red
      page.create_invoice_btn
      sleep(10)
      puts "Create Invoice Process Started"
      puts "Seleting Vendor"
      page.vendor_select_invoice_page.select ("YBP Library Services")
      sleep(15)
      puts "Setting Invoice Date"
      page.invoice_date.set '05/10/2015'
      puts "Setting Invoice Amount"
      page.invoice_amount.set '10'
      sleep(5)
      page.payment_method.select 'Check'
      sleep(5)
      page.process_item_link
      sleep(5)
      puts "Searching purchase order"
      puts "po-id --->#@purchase_order_id"
      page.purchase_order_search.set @purchase_order_id
      sleep(10)
      page.send_keys :enter
      sleep(10)
      puts "Adding purchase order"
      page.add_po
      sleep(10)
      page.blanketApprove_invoice
      sleep(30)
    end
  end

end