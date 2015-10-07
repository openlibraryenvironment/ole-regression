class Single_record_import_dataobject < DataFactory

  include Foundry
  include DateFactory
  include StringFactory
  include Workflows

  attr_accessor :file_name,
                :file_type,
                :title,
                :preference_name,
                :item_type,
                :item_status

  def initialize (browser , opts={})
    @browser = browser
    defaults={
        preference_name: "Admin Import",
        item_type: "BOOK",
        item_status: "Available"
    }
    set_options(defaults.merge(opts))
  end

  def single_record_import
    visit Singlerecordimport do |page|
      page.describe
      page.single_record_import_link
      upload_file = $target_folder+"/"+file_name+"."+file_type
      page.upload_mrc_file.set upload_file
      page.load
      page.local_marc
      @title = page.title
      puts "when select ---> #@title"
      page.next
      page.preference_name.select(@preference_name)
      page.load
      page.pref_next
      page.continue_bib_process
      page.continue_instance_process
      page.continue_instance_process
      page.item_type.set @item_type
      page.item_status.select(@item_status)
      page.save_instance_item
      page.edit
      page.windows[1].use
      sleep(5)
    end
  end

end