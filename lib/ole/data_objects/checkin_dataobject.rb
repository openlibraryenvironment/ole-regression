class Checkin_dataobject < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :item_id,
                :circulation_desk

  def initialize (browser , opts={})
    @browser = browser
    default = {
        circulation_desk: "BL_EDUC"
    }
    set_options(default.merge(opts))
  end

  def item_checkin
    on ItemCheckoutAndCkeckin do |page|
      page.deliver
      page.return
      if(page.circ_desk_val != "1")
        page.select_circ_desk.select(@circulation_desk)
        page.circ_desk_button
        #sleep(5)
      end
      page.checkin.set @item_id
      #sleep(3)
      page.send_keys :enter
      page.checkin_button
      #sleep(5)
    end
  end

end