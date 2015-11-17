class Parameters_dataobject < DataFactory

  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :parameter_name,
                :parameter_value



  def initialize (browser , opts={})
    @browser = browser
    default = {
        parameter_name: "RECALL_HOLD_ITEM_STATUS",
        parameter_value: "LOANED;ONHOLD"
    }
    set_options(default.merge(opts))
  end

  def recall_hold_item
    visit Parameters do |page|
      page.admin
      page.parameter
      page.parameter_name.set @parameter_name
      page.search_parameter
      page.edit_parameter
      page.description.set "test"
      page.parameter_value.set @parameter_value
      page.submit_parameter
    end
  end
end