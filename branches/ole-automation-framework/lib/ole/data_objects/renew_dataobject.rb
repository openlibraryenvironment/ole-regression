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
      page.select_loaned_item
      page.alter_due_date
      page.set_past_due_date.set @past_due_date
      page.update_past_date

      page.select_loaned_item
      page.renew
      page.select_box
      page.set_due_date.set @due_date
      page.circ_renew_btn
      page.ok_general_info
      # page.checkout_item_control.set @item_id
      # page.send_keys :enter
      # page.proceed_renew_item
      # page.renew_custom_due_date.set @due_date
      # page.renew_custom_due_date_button
      # page.ok_general_info
      sleep(3)
    end
  end

end