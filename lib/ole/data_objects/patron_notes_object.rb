class PatronNotesObject < DataFactory
  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :note_type,
                :note_text,
                :note_level

  def generate_random_string(length=6)
    string = ""
    chars = ("a".."z").to_a
    length.times do
      string << chars[rand(chars.length-1)]
    end
    string
  end

  def initialize(browser, opts={})
    @browser = browser
    defaults = {
        note_type: ["General","Block","Checkin","Staff","User"].sample,
        note_text: generate_random_string,
        note_level: 1
    }
    set_options(defaults.merge(opts))
  end

  def create
    on PatronPage do |page|
      sleep(3)
      page.note_type.select(@note_type)
      sleep(3)
      page.note_text.set @note_text

      page.add_note
    end
  end

  def delete (opts={})
    on PatronPage do |page|
      sleep(3)
      page.delete_note(opts = @note_level)
      sleep(3)
    end

  end


end





