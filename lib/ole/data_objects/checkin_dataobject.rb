class Checkin_dataobject < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :item_id,
                :circulation_desk,
                :circulationdesk_code,
                :pop_up_message

  def initialize (browser , opts={})
    @browser = browser
    default = {
        circulation_desk: "BL_EDUC"
    }
    set_options(default.merge(opts))
  end

  def item_checkin
    visit ItemCheckoutAndCkeckin do |page|
      page.deliver
      page.return
      if(page.circ_desk_val != "1")
        page.select_circ_desk.select(@circulation_desk)
        page.circ_desk_button
        sleep(5)
      end
      page.checkin.set @item_id
      #sleep(3)
      page.send_keys :enter
      page.checkin_button

      if(@pop_up_message == true)
        page.test_pop_up
      end
      #sleep(5)
    end
  end

  def checkin_with_different_location
    visit ItemCheckoutAndCkeckin do |page|
      page.deliver
      page.return
      page.select_circ_desk.select(@circulation_desk)
      page.circ_desk_button
      sleep(5)
      page.checkin.set @item_id
      page.send_keys :enter
      page.continue_checkin
      page.checkin_button
    end
  end

  def circulation_desk_location
    visit ItemCheckoutAndCkeckin do |page|
      @arrays = Array.new
      @count_level = 0
      page.maintenance
      page.circ
      page.circulation_desk_code.set @circulationdesk_code
      sleep(5)
      page.circ_search
      page.edit_circ
      sleep(5)
      count = page.location_count
      for count_level in 0 .. count-2
        location = page.location_value(opts=line_level=count_level)
        @arrays.push(location)
        if(location == "B-EDUC/BED-STACKS")
          if(page.pop_up_message_check(opts=line_level=count_level) == true)
            @pop_up_message = true
            break
          end
        end
        count_level+=1
      end
      unless @arrays.include? "B-EDUC/BED-STACKS"
        page.description.set "test"
        page.location.set "B-EDUC/BED-STACKS"
        page.add_location
        page.submit_circ
      end
    end
  end

end