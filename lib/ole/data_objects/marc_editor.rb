class Marc_editor < DataFactory

  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :line_level,
                :item_barcode,
                :local_item_id,
                :title,
                :issn_num,
                :item_id

  def initialize(browser,opts={})
    @browser = browser
    defaults={
        issn_num: "10001"
    }
    set_options(defaults.merge(opts))
  end

  def create_bib
    visit Marc_editor_fields do |page|

      page.describe
      page.open_marc_editor
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
    end
  end

  def create_holding
    on Marc_editor_fields do |page|
      page.add_holding
      if(page.holding_location_value == false)
        page.windows[1].use
        puts "using new window"
        page.holding_location.set 'B-EDUC/BED-STACKS'
        page.bib_submit
        sleep(3)
        @local_item_id = page.local_id
        puts "local id---> #@local_item_id"
        sleep(3)
        create_item
      else
        puts "In the same window"
        page.holding_location.set 'B-EDUC/BED-STACKS'
        page.bib_submit
        sleep(3)
        @local_item_id = page.local_id
        puts "local id---> #@local_item_id"
        sleep(3)
          if(page.open_item == false)
            page.click_icon
          end
        page.click_item
        page.windows[1].use
        page.set_barcode.set @item_barcode
        page.select_item_type.set "BOOK"
        page.item_status.select("Available")
        @item_id = page.item_id
        page.bib_submit
        sleep(5)
        page.windows[1].close
      end
    end
  end

  def create_e_holding
    on Marc_editor_fields do |page|
      page.add_e_holding
      if(page.e_holding_value == false)
        puts "new window"
        page.windows[1].use
        page.save_e_holding
        sleep(3)
        page.windows[1].close
      else
        puts "same window"
        page.save_e_holding
      end
      sleep(3)
    end
  end

  def create_item
    on Marc_editor_fields do |page|
      if(page.open_item == false)
        page.click_icon
      end
      page.click_item
      page.windows[2].use
      page.set_barcode.set @item_barcode
      page.select_item_type.set "BOOK"
      page.item_status.select("Available")
      @item_id = page.item_id
      page.bib_submit
      sleep(5)
      page.windows[2].close
      page.windows[1].close
    end
  end

  def search_item
    visit Search_workbench do |page|
      page.search_workbench
      page.search_selection_type.select("Item")
      #page.item_search_condition.select("Item Barcode")
      page.set_item_barcode.set @item_barcode
      page.search
    end
  end


end