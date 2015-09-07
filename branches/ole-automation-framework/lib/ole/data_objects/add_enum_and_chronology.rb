class Add_enum_and_chronology < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :enum_caption1,
                :enum_caption2,
                :enum_level1,
                :enum_level2,
                :chron_caption1,
                :chron_caption2,
                :chron_level1,
                :chron_level2,
                :line_level,
                :condition,
                :issue_note

  def initialize(browser , opts={})
    @browser = browser
    defaults = {
        enum_caption1: "v.",
        enum_caption2: "no.",
        chron_caption1: "[year]",
        chron_caption2: "[month]",
    }
    set_options(defaults.merge(opts))
  end

  def create
    on Serial_receiving do |page|
      if(@condition == "receive")
      page.enum_caption(opts=line_level=1).set enum_caption1
      page.enum_caption(opts=line_level=2).set enum_caption2
      page.enum_level(opts=line_level=1).set enum_level1
      page.enum_level(opts=line_level=2).set enum_level2
      page.chron_caption(opts=line_level=1).set chron_caption1
      page.chron_caption(opts=line_level=2).set chron_caption2
      page.chron_level(opts=line_level=1).set chron_level1
      page.chron_level(opts=line_level=2).set chron_level2
        page.receive
      else
        page.special_issue
        page.issue_note.set uniq_alphanums
        page.receive_issue_note
      end
      sleep(5)
    end
  end
end