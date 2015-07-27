Given(/^I am log in as ole-quickstart$/) do
  log_in("ole-quickstart")
end
When(/^I am setting pickup location$/) do
  @circ_desk = make Circulation_desk
  @circ_desk.create
end

Then(/^document should be successfully submit$/) do
  #@circ_desk.check_location
  @arrays = Array.new
  @count_level = 0
  on Circulationdesk do |page|
    page.doc_search
    page.search
    page.open_circ
    sleep(10)
    page.windows[1].use
    counts = page.location_count
    for @count_level in 0 .. counts-1
      @location = page.get_location(opts = @count_level)
      @arrays.push(@location)
      @count_level+=1
    end
    unless @arrays.include? "B-EDUC/BED-STACKS"
      raise "pick up location is not successfully added"
    end
    page.windows[1].close
  end
end