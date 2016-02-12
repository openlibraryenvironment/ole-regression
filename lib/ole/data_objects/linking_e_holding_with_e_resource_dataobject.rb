class Linking_e_holding_with_e_resource_dataobject < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :line_level,
                :item_barcode,
                :local_item_id,
                :title,
                :issn_num,
                :item_id,
                :platform_name

  def initialize(browser,opts={})
    @browser = browser
    defaults={
        issn_num: "10001"
    }
    set_options(defaults.merge(opts))
  end

  def create_bib
    on Linking_e_holding_with_e_resource_page do |page|
      page.datafield_tag(opts=@line_level=0).set '245'
      page.datafield_value(opts=@line_level=0).set @title
      page.add_tag_button(opts=@line_level=0)
      page.datafield_tag(opts=@line_level=1).set '100'
      page.datafield_value(opts=@line_level=1).set 'Steven Spielberg'
      page.add_tag_button(opts=@line_level=1)
      page.datafield_tag(opts=@line_level=2).set '999'
      page.datafield_value(opts=@line_level=2).set '|b  DreamWorks'
      page.add_tag_button(opts=@line_level=2)
      page.datafield_tag(opts=@line_level=3).set '022'
      page.datafield_value(opts=@line_level=3).set @issn_num
      page.bib_submit
      sleep(3)
      page.windows[0].use
      sleep(3)
      page.save_instance
      sleep(5)
      page.windows[1].close
    end
  end

  def link_e_holdings
    on Linking_e_holding_with_e_resource_page do |page|
      page.search_e_holdings.set @title
      page.search_button
      page.select_search_results
      page.select_e_holding
      page.e_holding_display_list
      page.link
      page.windows[0].use
      sleep(3)
      page.save_instance
      sleep(5)
    end
  end

  def create_e_holding_with_existing_bib
    on Linking_e_holding_with_e_resource_page do |page|
      page.search_e_holdings.set @title
      page.search_button
      if(page.e_holding_link_value == "Create New EInstance")  #"Create New EInstance" link is in 5th column in 2.1 and 6th column in 2.0
        sleep(3)
        page.create_e_holding_link
      else
        sleep(3)
        page.e_holding_link
      end
      page.windows[2].use
      name = @platform_name
      puts name
      if(name != nil)
        page.platform.select(@platform_name)
      end
      page.save_e_instance
      page.windows[0].use
      sleep(3)
      page.save_instance
      sleep(5)
      page.windows[2].close
      page.windows[1].close
    end
  end

  def e_holding_platform
    visit E_resource_platform do |page|
      page.select_acquire
      page.platform
      page.platform_name.set @platform_name
      page.save_platform
      sleep(10)
    end
  end
end