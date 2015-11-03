class Edit_patron_bill_dataobject < DataFactory

  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :patron_id,
                :fee_type,
                :description

  def initialize (browser , opts={})
    @browser = browser
    defaults = {
        fee_type: "Service Fee",
        description: "test"
    }
    set_options(defaults.merge(opts))
  end

  def edit_patron_bill fee_amount

    visit Edit_patron_bill_page do |page|
      if (page.deliver_red_tab == true)
        puts "deliver"
        page.deliver_red
      else
        page.deliver_green
      end
      page.edit_patron_bill
      page.patron_id.set @patron_id
      page.search_patron
      page.edit_patron
      page.doc_description.set @description
      page.select_fee_type.select(@fee_type)
      page.add_fee_amount.set fee_amount
      page.add_fee_type
      sleep(10)
      $document_id = page.doc_number
      puts $document_id
      page.submit_patron
      sleep(10)
    end

  end
end