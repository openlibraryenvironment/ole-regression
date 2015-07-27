class Loan < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :item_barcode,
                :due_date,
                :altered_due_date

  def initialize(browser , opts={})
    @browser = browser
    defaults = {

        altered_due_date: (Date.today-1).strftime("%m/%d/%Y")
    }
    set_options(defaults.merge(opts))
  end

  def create
    on CheckOut_Item do |page|

      page.check_current_item
      page.header_due_date_button
      sleep(5)
      page.set_due_date.set @altered_due_date
      page.alter_due_date_button
      sleep(10)
      @due_date = page.get_due_date
      puts "Item due date #@due_date"
      sleep(3)
      page.renew_item_barcode.set @item_barcode
      page.send_keys :enter
      sleep(3)
      page.proceed_renew
      sleep(3)
      @due_date = page.get_due_date
      sleep(5)
    end
  end
end

