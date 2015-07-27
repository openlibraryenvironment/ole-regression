class Circulation_desk < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :count,
                :location,
                :array,
                :count_level,
                :counts,
                :circulationdesk_code

  def initialize(browser, opts={})
    @browser = browser

    defaults = {
        count_level: 0,
        circulationdesk_code: 'BL_EDUC'
    }
    set_options(defaults.merge(opts))

  end

  def create(opts={})
    @array = Array.new
    @count_level= 0
    visit Circulationdesk do |page|
      page.maintenance
      page.circ
      page.circulation_desk_code.set @circulationdesk_code
      sleep(5)
      page.circ_search
      page.edit_circ
      sleep(5)
      page.description.set "test"
      count = page.count_var
      if count == 1
        page.set_location.set "B-EDUC/BED-STACKS"
        page.add_location
      else
        for count_level in 0..count-2 do
          @location = page.previous_location(opts = @count_level)
          array.push(@location)
          @count_level+=1
        end
        @count_level = 0
        unless array.include? "B-EDUC/BED-STACKS"
          page.set_location.set "B-EDUC/BED-STACKS"
          page.add_location
        end
      end
      page.submit_circ
      sleep(10)
    end
  end


end