class RenewDataobject < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :item_id,
                :past_due_date,
                :due_date

  def initialize (browser , opts={})
    @browser = browser
    default = {
        past_due_date: (Date.today-1).strftime("%m/%d/%Y"),
        due_date:(Date.today+10).strftime("%m/%d/%Y")
    }
    set_options(default.merge(opts))
  end

  def item_renewal
    on ItemCheckoutAndCkeckin do |page|
      alter_due_date
      page.select_loaned_item
      sleep(5)
      page.renew
      sleep(10)
      page.ok_general_info
      sleep(10)
    end
  end

  def alter_due_date
    on ItemCheckoutAndCkeckin do |page|
      page.select_loaned_item
      page.alter_due_date
      page.set_past_due_date.set @past_due_date
      page.update_past_date
      sleep(10)
    end
  end

end