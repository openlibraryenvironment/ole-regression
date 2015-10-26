class Transfer_item_and_holding_dataobject < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :item_title1,
                :item_title2,
                :doc_field_type

  def initialize(browser,opts={})
    @browser = browser
    defaults={
        doc_field_type: "Title"
    }
    set_options(defaults.merge(opts))
  end

  def transfer_item_and_holding
    visit Transfer_item_and_holding do |page|
      page.describe
      page.transfer_title_holdings_items
      page.doc_type_field.select(@doc_field_type)
      page.item_title.set @item_title1
      puts "tree1's title ---> #@item_title1"
      page.search_button
      page.search_result
      page.copy_tree1
      page.item_title.set @item_title2
      puts "tree2's title ---> #@item_title2"
      page.search_button
      page.search_result
      page.copy_tree2
      page.icon
      page.left_tree_holding_icon
      page.right_node_icon
      page.right_tree_holding_icon
      page.left_tree_item
      page.right_tree_item
      page.transfer_LTR
      page.keep_holdings
      sleep(5)
    end
  end
end