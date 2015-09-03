class Marc_editor < DataFactory

  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :line_level,
                :item_barcode,
                :local_id

  def initialize(browser,opts={})
    @browser = browser
    defaults={

    }
    set_options(defaults.merge(opts))
  end

  def create_bib
    visit Marc_editor_fields do |page|
      page.describe
      page.open_marc_editor
      page.datafield_tag(opts=@line_level=0).set '245'
      page.datafield_value(opts=@line_level=0).set 'Catch Me If You Can'
      page.add_tag_button(opts=@line_level=0)
      page.datafield_tag(opts=@line_level=1).set '100'
      page.datafield_value(opts=@line_level=1).set 'Steven Spielberg'
      page.add_tag_button(opts=@line_level=1)
      page.datafield_tag(opts=@line_level=2).set '999'
      page.datafield_value(opts=@line_level=2).set '|b  DreamWorks'
      page.bib_submit
      sleep(3)
    end
  end

  def create_holding
    on Marc_editor_fields do |page|
      page.add_holdings
      page.holding_location.set 'B-EDUC/BED-STACKS'
      page.bib_submit
      sleep(3)
    end
  end

  def create_item
    on Marc_editor_fields do |page|
      page.click_icon
      page.click_item
      page.windows[1].use
      page.set_barcode.set @item_barcode
      page.item_type.select("Book")
      page.item_status.select("Available")
      @local_id = page.local_id
      puts "local id---> #@local_id"
      page.bib_submit
      sleep(5)
      page.windows[1].close
    end
  end

  def search_item
    visit Search_workbench do |page|
      page.search_workbench
      page.search_selection_type.select("Item")
      page.item_search_condition.select("Item Barcode")
      page.set_item_barcode.set @item_barcode
      page.search
    end
  end


end