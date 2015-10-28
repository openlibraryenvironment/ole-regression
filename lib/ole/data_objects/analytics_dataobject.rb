class Analytics_dataobject < DataFactory

  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :item_title1,
                :item_title2,
                :analytics_variable,
                :analytics_item

  def initialize(browser , opts={})
    @browser = browser
    defaults={

    }
    set_options(defaults.merge(opts))

  end

  def create_analytics
    visit Analytics do |page|
      page.describe
      page.analytics
      page.item_title.set @item_title1
      puts "first item #@item_title1"
      page.search_button
      page.search_result
      page.select_series
      page.item_title.set @item_title2
      puts "second item #@item_title2"
      page.search_button
      page.search_result
      page.select_analytics
      page.series_holding
      page.analytics_item
      page.create_analytics
      sleep(5)
    end
  end

  def check_analytics
    visit Analytics do |page|
      page.search_workbench
      page.search_text.set @item_title1
      page.search
      page.click_title
      page.windows[1].use
      @analytics_variable = page.show_analytics
      @analytics_item = page.show_analytics_item
      sleep(5)
      page.windows[1].close
    end
  end
end