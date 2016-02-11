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
        due_date: "null"
    }
    set_options(default.merge(opts))
  end

  def set_fixed_due_date
    visit Fixed_due_date_page do |page|
      count_value = 0
      page.maintenance
      page.fixed_due_date
      page.select_circ_policy.select("Circ Policy BOOK for Renewal")
      page.search
      if(page.values_exists == "One item retrieved.")
        page.edit
        page.description.set'test'
        count = page.total_rows
        puts count
        for count_value in 0 .. count-2
          fixed_date = page.due_date_fixed(opts=line_level=count_value)
          if(Date.parse(DateTime.strptime(fixed_date,"%m/%d/%Y").to_s).to_s >= Date.today.to_s)
            @due_date = fixed_date
            puts "fixed due date is #@due_date"
            break
          else
            count_value+=1
          end
        end
        if(@due_date == "null")
          page.from_date.set @from_date
          page.to_date.set @to_date
          page.add_fixed_due_date.set @fixed_due_date
          page.add
          @due_date=@fixed_due_date
          puts "new fixed due date #@due_date"
        end
        sleep(5)

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
        @due_date=@fixed_due_date
        page.submit
        sleep(5)

      end
    end
  end
end