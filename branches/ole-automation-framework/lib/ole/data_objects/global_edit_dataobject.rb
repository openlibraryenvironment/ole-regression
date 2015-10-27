class Global_edit_dataobject < DataFactory

  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :item_title1,
                :item_title2,
                :doc_field_type,
                :item_location,
                :doc_field,
                :location1,
                :location2

  def initialize(browser , opts={})
    @browser = browser
    defaults = {
        doc_field_type: "Title",
        item_location: "API",
        doc_field: "Items"

    }
    set_options(defaults.merge(opts))
  end

  def global_edit
    visit Transfer_item_and_holding do |page|
      page.describe
      page.global_edit
      page.document_type.select(@doc_field)
      page.document_type_field.select(@doc_field_type)
      page.item_title.set @item_title1
      puts "first item ---> #@item_title1"
      page.search_button
      page.item_search_results(opts = line_level=0)
      page.add_items
      page.item_title.set @item_title2
      puts "second item ---> #@item_title2"
      page.search_button
      page.item_search_results(opts = line_level=0)
      page.add_items
      page.view_items
      page.edit_items
      sleep(5)
      page.windows[1].use
      sleep(5)
      page.location_info_section
      page.edit_item_location.set @item_location
      page.update_edited_items
      sleep(5)
      page.windows[1].close
    end
  end

  def verify_item_locations item_title , var
    on Transfer_item_and_holding do |page|
      page.search_workbench
      page.search_text.set item_title
      page.search
      page.click_title
      page.windows[1].use

      page.open_item
      page.windows[2].use
      page.open_item_location
      if(var == 1)
        @location1 = page.item_location
        puts "item1's location  #@location1"
      else
        @location2 = page.item_location
        puts "item2's location  #@location2"
      end
      page.windows[2].close
      page.windows[1].close
    end
  end


end