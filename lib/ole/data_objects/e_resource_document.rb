class EResourceDocument < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :title,
                :material_type,
                :format_type,
                :content_type,
                :local_id,
                :e_resource_identifier,
                :po_identifier,
                :tab,
                :line_level

  def initialize(browser, opts={})
    @browser = browser
    defaults = {
        title: "test",
        material_type: ["Journal" , "Database"].sample,
        format_type: ["E-Book" , "E-Journal" , "Book" , "Journal" , "DVD" , "CD" ,"Other"].sample,
        content_type: ["Text" , "Images"].sample
    }
    set_options(defaults.merge(opts))

  end

  def requisition_local_id
    on E_resource do |page|
      page.doc_search
      sleep(5)
      page.doc_id.set $doc_value
      page.search_req
      sleep(3)
      page.doc_id_link
      page.windows[1].use
      page.click_title
      page.windows[2].use
      page.click_holdings
      page.windows[3].use
      @local_id = page.holding_local_id
      puts @local_id
      page.windows[3].close
      page.windows[2].close
      page.windows[1].use
      page.view_related_documents
      @po_identifier = page.po_id
      puts "po number is #@po_identifier"
      page.windows[1].close
    end
  end

  def create_e_resource_document
    visit E_resource do |page|
      page.select_acquire
      page.e_resource
      page.doc_name.set @title
      page.material_type.select (@material_type)
      page.format_type.select (@format_type)
      page.content_type.select (@content_type)
      $document_id = page.doc_value
      page.save
      @e_resource_identifier = page.e_resource_id
      sleep(5)
    end
  end

  def search_e_resource
    on E_resource do |page|
      page.open_e_holding
      page.create_instance
      page.select_instance_id
      page.windows[1].use
      page.search_conditions.select ("Local Identifier")
      page.doc_type.select ("Holdings")
      page.search_text.set @local_id
      page.search_button
      page.search_result
      page.holdings
      page.holdings_search_results
      page.holdings_link
      sleep(3)
      page.windows[0].use
      page.save_instance
      sleep(3)
    end
  end

  def create_e_instance
    on E_resource do |page|
      page.open_e_holding
      page.create_instance
      sleep(5)
      page.new_e_holding(opts = @line_level)
      sleep(5)
      page.windows[1].use
    end
  end
end