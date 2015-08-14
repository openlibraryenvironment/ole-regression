class Serial_receiving_transaction < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :po_number,
                :sub_status_field,
                :doc_id,
                :search_conditions,
                :title,
                :line_level,
                :issn,
                :record_number,
                :local_identifier,
                :item_identifier,
                :doc_type,
                :tag



  def initialize(browser , opts={})
    @browser = browser
    defaults = {
        sub_status_field: ["Unknown","Other receipt or acquisition status","Received and complete or ceased","On order","Currently received","Not currently received","Not Received","Received"].sample
    }
    set_options(defaults.merge(opts))
  end

  def create_serial_receiving_transaction
    visit Serial_receiving do |page|

      if(page.red_tab == true)
        puts "select and acquire"
      else
        page.select_acquire
      end
      page.search_and_receive
      choose_search_condition
      page.search_button
      sleep(5)
      if(@search_conditions == "Serials Receiving Record No")
        page.show_transaction
      else
        page.create_serial_receiving
      end

      sleep(5)
      page.substatus_field.select (@sub_status_field)
      $document_id = page.document_number
      puts $document_id
      @local_identifier = page.local_id
      puts "local id is #@local_identifier"
      page.save_transaction
      sleep(5)
      @record_number = page.record_no
    end
  end

  def choose_search_condition
    on Serial_receiving do |page|

    if(@search_conditions == "Title")
      page.search_fields(opts = @line_level).set @title
    elsif(@search_conditions == "ISSN")
      page.search_fields(opts = @line_level).set @issn
    elsif(@search_conditions == "Serials Receiving Record No")
      page.search_fields(opts = @line_level).set @record_number
    elsif(@search_conditions == "Local Identifier")
      page.search_fields(opts = @line_level).set @local_identifier
    else
      if(@search_conditions == "Purchase Order No")
        page.search_fields(opts = @line_level).set @po_number
      end
    end

   end
  end

  def search_workbench
    visit Search_workbench do |page|
      page.search_workbench
      sleep(5)
      page.search_text.set @item_identifier
      page.doc_field.select (@doc_type)
      page.search
      sleep(5)
      page.click_title
      page.windows[1].use
      sleep(5)
      page.add_tag
      page.datafield_tag.set @tag
      page.datafield_value.set @issn
      page.submit
      sleep(5)
      page.holding_tree
      page.windows[2].use
      sleep(5)
      @local_identifier=page.local_id_holding
      puts "local identifier is #@local_identifier"
      page.windows[2].close
      page.windows[1].close
    end
  end
end

