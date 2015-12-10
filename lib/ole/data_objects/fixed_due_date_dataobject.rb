class Fixed_due_date_dataobject < DataFactory

  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :from_date,
                :to_date,
                :fixed_due_date,
                :due_date

  def initialize (browser , opts={})
    @browser = browser
    default = {

    }
    set_options(default.merge(opts))
  end

  def set_fixed_due_date
    visit Fixed_due_date_page do |page|
      page.maintenance
      page.fixed_due_date
      page.select_circ_policy.select("Circ Policy BOOK for Renewal")
      page.search
      if(page.values_exists == "One item retrieved.")
        page.edit
        page.description.set'test'
        @due_date = page.fixed_duedate
        page.submit
      else
        page.create_circ_policy
        page.description.set'test'
        page.create_circ_policy_set.select("Circ Policy BOOK for Renewal")
        page.from_date.set @from_date
        page.to_date.set @to_date
        page.add_fixed_due_date.set @fixed_due_date
        page.add
        sleep(5)
        page.submit
        sleep(5)

      end
    end
  end
end